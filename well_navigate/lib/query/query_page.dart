import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:well_navigate/query/bundle_list_view.dart';
import 'package:well_navigate/query/query_notifier.dart';
import 'package:well_navigate/query/url_picker.dart';
import 'package:well_navigate/query/url_picker_controller.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  UriState uriState = UriState(
    Uri.parse('https://hapi.fhir.org/baseR4/Appointment'),
    {'Content-Type': 'application/json'},
  );

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: context<QueryNotifier>(),
        builder: (context, child) => Padding(
          padding: const EdgeInsets.all(16),
          child: _mainColumn(context),
        ),
      );

  Column _mainColumn(BuildContext context) => Column(
        children: <Widget>[
          UrlPicker(
            uriState: uriState,
            onChanged: (u) => setState(() => uriState = u),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async =>
                context<QueryNotifier>().makeRequest(uriState),
            child: const Text('Send Request'),
          ),
          const SizedBox(height: 20),
          const Text('Response:'),
          Expanded(
            child: switch (context<QueryNotifier>()) {
              QueryNotifier(isLoading: true) => const Center(
                  child: CircularProgressIndicator(),
                ),
              _ => switch (context<QueryNotifier>().queryResult) {
                  (final OperationOutcome<dynamic> oo) =>
                    Text(oo.text?.div ?? ''),
                  (final Bundle bundle)
                      when bundle.entry?.isNotEmpty ?? false =>
                    BundleListView(entries: bundle.entry!.toFixedList()),
                  _ => const Text('No results'),
                }
            },
          ),
        ],
      );
}
