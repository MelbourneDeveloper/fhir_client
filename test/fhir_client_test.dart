import 'dart:convert';
import 'dart:io';

import 'package:fhir_client/models/error.dart' as err;
import 'package:fhir_client/models/resource.dart';

import 'package:test/test.dart';

void main() {
  group('Deserialization', () {
    test('Deserialize org search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization?type=clinic&_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/orgsearch.json').readAsString();

      final result = Bundle.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final entries = result.entry!.toList();

      expect(entries.length, 5);
      expect(entries.first.resource!.id, '2640211');
      expect(entries[1].resource!.id, '2640389');
      final org = entries.first.resource! as Organization;
      expect(org.identifier!.first.type!.text, 'SNO');
      expect(
        org.type!.first.coding!.first.system,
        'http://miup.jp/bangladesh/organization-type',
      );

      expect(org.resourceType, 'Organization');
      expect(org.id, '2640211');

      expect(org.meta!.versionId, '1');
      expect(org.meta!.lastUpdated, '2021-10-13T07:52:35.268+00:00');
      expect(org.meta!.source, '#VAvOSFPlfBChwJZ4');

      expect(org.identifier!.length, 1);
      expect(org.identifier!.first.type!.text, 'SNO');
      expect(org.identifier!.first.system, 'http://miup.jp/bangladesh/mej2021');
      expect(org.identifier!.first.value, '1');

      expect(org.active, true);

      expect(org.type!.length, 2);
      expect(
        org.type!.first.coding!.first.system,
        'http://miup.jp/bangladesh/organization-type',
      );
      expect(org.type!.first.coding!.first.code, 'clinic');
      expect(org.type!.first.coding!.first.display, 'clinic');
      expect(
        org.type!.last.coding!.first.system,
        'http://terminology.hl7.org/CodeSystem/organization-type',
      );
      expect(org.type!.last.coding!.first.code, 'prov');
      expect(org.type!.last.coding!.first.display, 'Healthcare Provider');

      expect(org.name, 'testclinic');

      expect(org.telecom!.length, 1);
      expect(org.telecom!.first.system, 'phone');
      expect(org.telecom!.first.value, '2342134234');
      expect(org.telecom!.first.use, 'work');

      expect(org.address!.length, 1);
      expect(org.address!.first.use, 'work');
      expect(org.address!.first.type, 'physical');
      expect(org.address!.first.line!.length, 2);
      expect(org.address!.first.line!.first, 'asda');
      expect(org.address!.first.line!.last, 'asd');
      expect(org.address!.first.city, 'ada');
      expect(org.address!.first.district, 'ada');
      expect(org.address!.first.state, 'asda');
      expect(org.address!.first.postalCode, '23423');
      expect(org.address!.first.country, 'BANGLADESH');
    });

    test('Deserialize PractitionerRole search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/PractitionerRole?_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/practicionerrolesearch.json')
          .readAsString();

      final result = Bundle.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final entries = result.entry!.toList();

      expect(entries.length, 10);
      expect(entries.first.resource!.resourceType, 'PractitionerRole');
      expect(
        entries.first.resource!.id,
        '000-a24198ce-1b4b-4364-9dd4-03b3c5b5bd41-PractitionerRole',
      );

      final pr = entries.first.resource! as PractitionerRole;

      expect(
        pr.extension!.first.url,
        'http://pdx.bcbs.com/providerdataexchange/StructureDefinition/providerdisplay',
      );
      final pr2 = entries[2].resource! as PractitionerRole;

      expect(
        pr2.code!.first.coding!.first.system,
        'http://nucc.org/provider-taxonomy',
      );
    });

    test('Deserialize org read result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization/2640211" -H "Content-Type: application/json"
      final json = await File('test/responses/readorg.json').readAsString();

      final result =
          Organization.fromJson(jsonDecode(json) as Map<String, dynamic>);

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
