import 'dart:convert';
import 'dart:io';

import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  group('Deserialization Tests', () {
    test('Deserialize org search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization?type=clinic&_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/orgsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonDecode(json) as Map<String, dynamic>) as Bundle;

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

      final org =
          Organization.fromJson(jsonDecode(json) as Map<String, dynamic>);

      expect(org.id, '2640211');
      expect(org.identifier!.first.type!.text, 'SNO');

      final map = org.toJson();

      expect(map['id'], '2640211');
    });

    test('Deserialize Practitioner by Org search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/2640211&_count=10" -H "Content-Type: application/json"

      final json =
          await File('test/responses/practiotionerbyorg.json').readAsString();

      final result =
          Resource.fromJson(jsonDecode(json) as Map<String, dynamic>) as Bundle;

      final practitioners =
          result.entry!.map((e) => e.resource! as Practitioner).toList();

      expect(practitioners.length, 1);
      expect(practitioners.first.id, '0000016f-a1db-e77f-0000-000000009ed4');

      final practitioner = practitioners.first;

      // Test individual properties of the practitioner
      expect(practitioner.id, '0000016f-a1db-e77f-0000-000000009ed4');
      expect(practitioner.meta!.versionId, '1');
      expect(
        practitioner.meta!.lastUpdated,
        '2020-03-24T17:59:12.935+00:00',
      );
      expect(
        practitioner.meta!.profile!.first,
        'http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner',
      );
      expect(
        practitioner.meta!.tag!.first.system,
        'https://smarthealthit.org/tags',
      );
      expect(
        practitioner.meta!.tag!.first.code,
        'Covid19 synthetic population from Synthea',
      );

      expect(
        practitioner.identifier!.first.system,
        'http://hl7.org/fhir/sid/us-npi',
      );
      expect(practitioner.identifier!.first.value, '40660');

      expect(practitioner.active, true);

      expect(practitioner.name!.first.family, 'Moen819');
      expect(practitioner.name!.first.given!.first, 'Calvin845');
      expect(practitioner.name!.first.prefix!.first, 'Dr.');

      expect(practitioner.telecom!.first.system, 'email');
      expect(
        practitioner.telecom!.first.value,
        'Calvin845.Moen819@example.com',
      );
      expect(practitioner.telecom!.first.use, 'work');
      expect(
        practitioner.telecom!.first.extension!.first.url,
        'http://hl7.org/fhir/us/core/StructureDefinition/us-core-direct',
      );
      expect(practitioner.telecom!.first.extension!.first.valueBoolean, true);

      expect(practitioner.address!.first.line!.first, '427 W COLORADO ST');
      expect(practitioner.address!.first.city, 'GLENDALE');
      expect(practitioner.address!.first.state, 'CA');
      expect(practitioner.address!.first.postalCode, '91204-3046');
      expect(practitioner.address!.first.country, 'US');

      expect(practitioner.gender, 'male');
    });

    test('Deserialize error result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/fcf35f09-a2eb-324f-9ec6-40cdeadc9322&_count=10" -H "Content-Type: application/json"
      final json =
          await File('test/responses/errorresponse.json').readAsString();

      final result = Resource.fromJson(jsonDecode(json) as Map<String, dynamic>)
          as OperationOutcome;

      expect(result.issue!.first.severity, 'error');
    });

    test('Deserialize Schedule search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Schedule?_count=10"

      final json =
          await File('test/responses/schedulcessearch.json').readAsString();

      final result =
          Resource.fromJson(jsonDecode(json) as Map<String, dynamic>) as Bundle;

      final schedules =
          result.entry!.map((e) => e.resource! as Schedule).toList();

      expect(schedules.length, 10);
      expect(schedules.first.id, '055fa740-99e1-4b42-a081-2e4030a2aa7a');

      final schedule = schedules[1];

      // Assert resource type
      expect(schedule.resourceType, 'Schedule');

      // Assert ID
      expect(schedule.id, '0e3309f0-b207-4a06-b3cd-f4d51d7feb76');

      // Assert identifier
      expect(schedule.identifier!.length, 1);
      expect(schedule.identifier![0].use, 'usual');
      expect(schedule.identifier![0].system, 'http://example.org/scheduleid');
      expect(schedule.identifier![0].value, '45');

      // Assert active status
      expect(schedule.active, true);

      // Assert service category
      expect(schedule.serviceCategory!.length, 1);
      expect(schedule.serviceCategory![0].coding!.length, 1);
      expect(schedule.serviceCategory![0].coding![0].code, '17');
      expect(
        schedule.serviceCategory![0].coding![0].display,
        'General Practice',
      );

      // Assert service type
      expect(schedule.serviceType!.length, 1);
      expect(schedule.serviceType![0].coding!.length, 1);
      expect(schedule.serviceType![0].coding![0].code, '124');
      expect(schedule.serviceType![0].coding![0].display, 'General Practice');

      // Assert specialty
      expect(schedule.specialty!.length, 1);
      expect(schedule.specialty![0].coding!.length, 1);
      expect(schedule.specialty![0].coding![0].code, '394802001');
      expect(schedule.specialty![0].coding![0].display, 'General medicine');

// Assert actors
      expect(schedule.actor!.length, 2);
      expect(
        schedule.actor![0].reference,
        'Location/bded1b2f-bdd5-424b-8725-4c6f3d525e07',
      );
      expect(schedule.actor![0].display, 'Norte');
      expect(
        schedule.actor![1].reference,
        'HealthcareService/70ab9bd6-ff24-4bfb-902f-86a5f47a2866',
      );
      expect(schedule.actor![1].display, 'Medicina General');

      // Assert planning horizon
      expect(schedule.planningHorizon!.start, '2023-12-01T00:00:00Z');
      expect(schedule.planningHorizon!.end, '2023-12-31T23:59:59Z');

      // Assert comment
      expect(
          schedule.comment,
          'Los SLOTS asociados a esta agenda, '
          'deberan estar asociados a Medicina General zona NORTE');
    });

    test('Deserialize Appointment search result', () async {
      //curl -X GET "https://hapi.fhir.org/baseR4/Appointment?_count=10"

      final json =
          await File('test/responses/appointmentsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonDecode(json) as Map<String, dynamic>) as Bundle;

      final appointments =
          result.entry!.map((e) => e.resource! as Appointment).toList();

      expect(appointments.first.id, '00f740554d7b1c5a');

      // Get the 3rd appointment
      final appointment = appointments[2];

      // Assert resource type
      expect(appointment.resourceType, 'Appointment');

      // Assert ID
      expect(appointment.id, '05fda0d9-7d96-4869-bccd-8976ed9f35d8');

      // Assert meta
      expect(appointment.meta!.versionId, '1');
      expect(appointment.meta!.lastUpdated, '2023-08-04T08:59:32.432+00:00');

      // Assert search mode
      expect(result.entry![2].search!.mode, 'match');
    });
  });

  group('Actual Call Tests', () {
    test('GET read Organization', () async {
      const baseUri = 'http://hapi.fhir.org/';
      const path = 'baseR4/Organization/2640211';
      final result = await Client().getResource<Organization>(baseUri, path)
          as Organization;

      expect(result.id, '2640211');
      expect(result.identifier!.first.type!.text, 'SNO');
    });

    test('GET read Organization - Error', () async {
      const baseUri = 'http://hapi.fhir.org/';
      const path = 'baseR4/Organizationz/2640211';
      final result =
          await Client().getResource<OperationOutcome<String>>(baseUri, path)
              as OperationOutcome;

      expect(
        result.issue!.first.diagnostics!.contains(
          // ignore: lines_longer_than_80_chars
          "HAPI-0302: Unknown resource type 'Organizationz' - Server knows how to handle: [Account, ActivityDefinition, AdverseEvent, Aller",
        ),
        true,
      );
    });

    test('GET search Practitioner by Org', () async {
      const baseUri = 'http://hapi.fhir.org/';
      const path =
          'baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/fcf35f09-a2eb-324f-9ec6-40cdeadc9322&_count=10';
      final bundle =
          await Client().getResource<Bundle>(baseUri, path) as Bundle;

      final practitioners =
          bundle.entry!.map((e) => e.resource! as Practitioner).toList();

      expect(practitioners.length, 1);
      expect(practitioners.first.id, '0000016f-a1db-e77f-0000-000000009ed4');
    });
  });

  group('Actual Extension Calls', () {
    test('searchPractitionerRoles Success', () async {
      final result = await Client()
          .searchPractitionerRoles('http://hapi.fhir.org/', count: 10);

      final bundleEntries = result as BundleEntries<PractitionerRole>;

      expect(bundleEntries.length, 10);
      expect(
        bundleEntries.entries.first.id,
        '000-a24198ce-1b4b-4364-9dd4-03b3c5b5bd41-PractitionerRole',
      );
    });

    test('searchSchedules Success', () async {
      final result =
          await Client().searchSchedules('http://hapi.fhir.org/', count: 10);

      final bundleEntries = result as BundleEntries<Schedule>;

      expect(bundleEntries.length, 10);
      expect(bundleEntries.entries[9].id, '10434942');
    });

    test('searchSchedules Error', () async {
      final result = await Client()
          //Note the bad URL
          .searchSchedules('http://hapi.fhir.org/broken/', count: 10);

      final oo = result as OperationOutcome<Schedule>;

      expect(
        oo.text!.status,
        'Exception or Error occurred when converting JSON to Resource',
      );
    });
  });
}
