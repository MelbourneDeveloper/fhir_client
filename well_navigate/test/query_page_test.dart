import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:well_navigate/query/query_notifier.dart';
import 'package:well_navigate/query/query_page.dart';

void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient((request) async {
      await Future<void>.delayed(const Duration(seconds: 1));

      if (request.url
          .toString()
          .startsWith('https://hapi.fhir.org/baseR4/Patient')) {
        return http.Response('{"resourceType": "Bundle"}', 200);
      }

      if (request.url
          .toString()
          .startsWith('https://hapi.fhir.org/baseR4/Appointment')) {
        return http.Response(
          File('../test/responses/appointmentsearch.json').readAsStringSync(),
          200,
        );
      }

      return http.Response('Not Found', 404);
    });
  });

  testWidgets('renders URL picker and send button', (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    expect(find.text('URL'), findsOneWidget);
    expect(find.text('Send Request'), findsOneWidget);
  });

  testWidgets('updates URI state when URL picker values change',
      (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.enterText(
      find.byType(TextField).first,
      'https://hapi.fhir.org/baseR4/Patient',
    );
    await tester.pump();

    expect(find.text('https://hapi.fhir.org/baseR4/Patient'), findsOneWidget);
  });

  testWidgets(
      "sends request and displays 'No results' "
      'list when successful result is empty', (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.enterText(
      find.byType(TextField).first,
      'https://hapi.fhir.org/baseR4/Patient',
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send Request'));
    await tester.pumpAndSettle();

    expect(find.text('No results'), findsOneWidget);
  });

  testWidgets('sends request and displays error when response is unsuccessful',
      (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.enterText(
      find.byType(TextField).first,
      'https://invalid-url',
    );
    await tester.tap(find.text('Send Request'));
    await tester.pumpAndSettle();

    //TODO: this test is valid but it's baking the incorret
    //error message into the test. We should be handling
    //the status code and displaying a meaningful error
    expect(
      find.text('''
<div>Error: FormatException: Unexpected character (at character 1)
Not Found
^
</div>'''),
      findsOneWidget,
    );
  });

  testWidgets('displays loading indicator while request is in progress',
      (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.enterText(
      find.byType(TextField).first,
      'https://hapi.fhir.org/baseR4/Patient',
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Send Request'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
  });

  testWidgets('adds and removes headers', (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.tap(find.text('Add Header'));
    await tester.pump();

    expect(find.text('Header Key'), findsNWidgets(2));
    expect(find.text('Header Value'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.remove_circle_outline).first);
    await tester.pump();

    expect(find.text('Header Key'), findsOneWidget);
    expect(find.text('Header Value'), findsOneWidget);
  });

  testWidgets('adds and removes parameters', (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.tap(find.text('Add Parameter'));
    await tester.pump();

    expect(find.text('Parameter Key'), findsNWidgets(2));
    expect(find.text('Parameter Value'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.remove_circle_outline).last);
    await tester.pump();

    expect(find.text('Parameter Key'), findsOneWidget);
    expect(find.text('Parameter Value'), findsOneWidget);
  });

  testWidgets(
      'sends request and displays bundle list '
      'when response contains multiple appointments', (tester) async {
    await tester.pumpWidget(_queryPageWithMockClient(mockClient));

    await tester.enterText(
      find.byType(TextField).first,
      'https://hapi.fhir.org/baseR4/Appointment',
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send Request'));
    await tester.pumpAndSettle();

    expect(find.text('Appointment - 00f740554d7b1c5a'), findsOneWidget);
    expect(find.text('Appointment - 059200e9f1d3e606'), findsOneWidget);
    expect(
      tester.widget<ListView>(find.byType(ListView)).semanticChildCount,
      11,
    );
  });
}

Widget _queryPageWithMockClient(MockClient mockClient) => CompositionRoot(
      compose: (b) {
        b
          ..addSingleton<http.Client>((c) => mockClient)
          ..addSingleton((c) => QueryNotifier(client: c<http.Client>()));
      },
      child: const MaterialApp(
        home: Scaffold(body: QueryPage()),
      ),
    );
