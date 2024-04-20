import 'dart:convert';
import 'dart:io';

import 'package:fhir_client/model.dart';
import 'package:test/test.dart';

void main() {
  group('Deserialization', () {
    test('Deserialize org search result', () async {
      final json = await File('test/responses/orgsearch.json').readAsString();

      final result = Result.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final entries = result.entry!.toList();

      expect(entries.length, 5);
      expect(entries.first.resource!.id, '2640211');
      expect(entries[1].resource!.id, '2640389');
      expect(entries.first.resource!.identifier!.first.type!.text, 'SNO');
    });
  });
}
