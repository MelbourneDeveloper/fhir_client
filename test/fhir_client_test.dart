import 'dart:convert';
import 'dart:io';

import 'package:fhir_client/models/error.dart' as err;
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/result.dart';
import 'package:test/test.dart';

void main() {
  group('Deserialization', () {
    test('Deserialize org search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization?type=clinic&_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/orgsearch.json').readAsString();

      final result = Result.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final entries = result.entry!.toList();

      expect(entries.length, 5);
      expect(entries.first.resource!.id, '2640211');
      expect(entries[1].resource!.id, '2640389');
      expect(entries.first.resource!.identifier!.first.type!.text, 'SNO');
    });

    test('Deserialize PractitionerRole search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/PractitionerRole?_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/practicionerrolesearch.json')
          .readAsString();

      final result = Result.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final entries = result.entry!.toList();

      expect(entries.length, 10);
      expect(entries.first.resource!.resourceType, 'PractitionerRole');
      expect(
        entries.first.resource!.id,
        '000-a24198ce-1b4b-4364-9dd4-03b3c5b5bd41-PractitionerRole',
      );
      expect(
        entries.first.resource!.extension!.first.url,
        'http://pdx.bcbs.com/providerdataexchange/StructureDefinition/providerdisplay',
      );

      expect(
        entries[2].resource!.code!.first.coding!.first.system,
        'http://nucc.org/provider-taxonomy',
      );
    });

    test('Deserialize org read result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization/2640211" -H "Content-Type: application/json"
      final json = await File('test/responses/readorg.json').readAsString();

      final result =
          Resource.fromJson(jsonDecode(json) as Map<String, dynamic>);

      expect(result.id, '2640211');
      expect(result.identifier!.first.type!.text, 'SNO');
    });

    test('Deserialize error result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Practitioner?organization=Organization/2640211&_count=10" -H "Content-Type: application/json"
      final json =
          await File('test/responses/errorresponse.json').readAsString();

      final result =
          err.Error.fromJson(jsonDecode(json) as Map<String, dynamic>);

      expect(result.issue!.first.severity, 'error');
    });
  });
}
