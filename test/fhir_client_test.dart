//This makes for good shortcuts in assertions. Consider
//moving these assertions to a separate file
// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

// Note: the best tests here are the ones in
// http Client Extension Calls - Mocked
// If you're going to add a resource, best to add a test there

import 'dart:io';

import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/administrative_gender.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:jayse/jayse.dart';
import 'package:test/test.dart';

const baseUri = 'http://hapi.fhir.org/';

void main() {
  group('Deserialization Tests', () {
    test('Appointment Search', () async {
      //curl -X GET "https://hapi.fhir.org/baseR4/Appointment?_count=10"

      final json =
          await File('test/responses/appointmentsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      final appointments =
          result.entry!.map((e) => e.resource! as Appointment).toFixedList();

      expect(appointments.first.id, '00f740554d7b1c5a');

      // Get the 3rd appointment
      final appointment = appointments[2];

      // Assert ID
      expect(appointment.id, '05fda0d9-7d96-4869-bccd-8976ed9f35d8');

      // Assert meta
      expectEquals(appointment.meta!.versionId, '1');
      final expectedLastUpdated = DateTime.utc(2023, 08, 04, 8, 59, 32, 432);
      expectEquals(
        appointment.meta!.lastUpdated,
        expectedLastUpdated,
      );

      // Assert search mode
      expect(result.entry![2].search!.mode, 'match');

      final map = appointment.meta!.json;
      final meta = Meta.fromJson(map);
      expectEquals(meta.lastUpdated, expectedLastUpdated);
    });

    test('OperationOutcome', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/fcf35f09-a2eb-324f-9ec6-40cdeadc9322&_count=10" -H "Content-Type: application/json"
      final json =
          await File('test/responses/errorresponse.json').readAsString();

      final result = Resource.fromJson(jsonValueDecode(json) as JsonObject)
          as OperationOutcome;

      expect(result.issue!.first.severity, 'error');
    });

    test('Organization Read', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization/2640211" -H "Content-Type: application/json"
      final json = await File('test/responses/readorg.json').readAsString();

      final org = Organization.fromJson(jsonValueDecode(json) as JsonObject);

      expect(org.id, '2640211');
      expect(org.identifier!.first.type!.text, 'SNO');

      final map = org.json;
      expect(map['resourceType'].stringValue, 'Organization');

      expect(map['id'].stringValue, '2640211');
    });

    test('Organization Search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization?type=clinic&_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/orgsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      final entries = result.entry!.toFixedList();

      expect(entries.length, 5);
      expect(entries.first.resource!.id, '2640211');
      expect(entries[1].resource!.id, '2640389');
      final org = entries.first.resource! as Organization;
      expect(org.identifier!.first.type!.text, 'SNO');
      expect(
        org.type!.first.coding!.first.system,
        Uri.parse('http://miup.jp/bangladesh/organization-type'),
      );

      expect(org.id, '2640211');

      expectEquals(org.meta!.versionId, '1');
      expectEquals(
        org.meta!.lastUpdated,
        DateTime.utc(2021, 10, 13, 7, 52, 35, 268),
      );
      expectEquals(org.meta!.source, '#VAvOSFPlfBChwJZ4');

      expect(org.identifier!.length, 1);
      expect(org.identifier!.first.type!.text, 'SNO');
      expect(
        org.identifier!.first.system,
        Uri.parse('http://miup.jp/bangladesh/mej2021'),
      );
      expect(org.identifier!.first.value, '1');

      expect(org.active, true);

      expect(org.type!.length, 2);
      expect(
        org.type!.first.coding!.first.system,
        Uri.parse('http://miup.jp/bangladesh/organization-type'),
      );
      expect(org.type!.first.coding!.first.code, 'clinic');
      expect(org.type!.first.coding!.first.display, 'clinic');
      expect(
        org.type!.last.coding!.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/organization-type'),
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

      final map = org.json;
      expect((map['address'] as JsonArray).value[0]['postalCode'].stringValue, '23423');
    });

    test('Practitioner Search result', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/2640211&_count=10" -H "Content-Type: application/json"

      final json =
          await File('test/responses/practiotionerbyorg.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      final practitioners =
          result.entry!.map((e) => e.resource! as Practitioner).toFixedList();

      expect(practitioners.length, 1);
      expect(practitioners.first.id, '0000016f-a1db-e77f-0000-000000009ed4');

      final practitioner = practitioners.first;

      // Test individual properties of the practitioner
      expect(practitioner.id, '0000016f-a1db-e77f-0000-000000009ed4');
      expectEquals(practitioner.meta!.versionId, '1');
      expectEquals(
        practitioner.meta!.lastUpdated,
        DateTime.utc(2020, 03, 24, 17, 59, 12, 935),
      );
      expect(
        practitioner.meta!.profile!.first,
        'http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner',
      );

      final tags = practitioner.meta!.tag!;

      expectEquals(
        tags.first.system,
        Uri.parse('https://smarthealthit.org/tags'),
      );
      expectEquals(
        tags.first.code,
        'Covid19 synthetic population from Synthea',
      );

      expect(
        practitioner.identifier!.first.system,
        Uri.parse('http://hl7.org/fhir/sid/us-npi'),
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
        Uri.parse(
          'http://hl7.org/fhir/us/core/StructureDefinition/us-core-direct',
        ),
      );
      expect(practitioner.telecom!.first.extension!.first.valueBoolean, true);

      expect(practitioner.address!.first.line!.first, '427 W COLORADO ST');
      expect(practitioner.address!.first.city, 'GLENDALE');
      expect(practitioner.address!.first.state, 'CA');
      expect(practitioner.address!.first.postalCode, '91204-3046');
      expect(practitioner.address!.first.country, 'US');

      expect(practitioner.gender, AdministrativeGender.male);

      final map = practitioner.json;
      final clonedPractitioner = Practitioner.fromJson(map);

      expect(clonedPractitioner.gender, AdministrativeGender.male);
    });

    test('PractitionerRole Search', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/PractitionerRole?_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/practicionerrolesearch.json')
          .readAsString();

      final result = Bundle.fromJson(jsonValueDecode(json) as JsonObject);

      final entries = result.entry!.toFixedList();

      expect(entries.length, 10);

      expect(
        entries.first.resource!.id,
        '000-a24198ce-1b4b-4364-9dd4-03b3c5b5bd41-PractitionerRole',
      );

      //TODO: Extension?
      // final pr = entries.first.resource! as PractitionerRole;

      // expect(
      //   pr.extension!.first.url,
      //   Uri.parse(
      //     'http://pdx.bcbs.com/providerdataexchange/StructureDefinition/providerdisplay',
      //   ),
      // );

      final pr2 = entries[2].resource! as PractitionerRole;

      expect(
        pr2.code!.first.coding!.first.system,
        Uri.parse('http://nucc.org/provider-taxonomy'),
      );
    });

    test('Schedule Search', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Schedule?_count=10"

      final json =
          await File('test/responses/schedulcessearch.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      final schedules =
          result.entry!.map((e) => e.resource! as Schedule).toFixedList();

      expect(schedules.length, 10);
      expect(schedules.first.id, '055fa740-99e1-4b42-a081-2e4030a2aa7a');

      expect(
        schedules.first.planningHorizon!.start,
        //Note: this is local time, which is kinda strange
        DateTime(2019, 11, 28, 8),
      );

      expect(
        schedules.first.planningHorizon!.end,
        //Note: this is local time, which is kinda strange
        DateTime(2021, 5, 31, 12),
      );

      final schedule = schedules[1];

      // Assert ID
      expect(schedule.id, '0e3309f0-b207-4a06-b3cd-f4d51d7feb76');

      // Assert identifier
      expect(schedule.identifier!.length, 1);
      expect(schedule.identifier![0].use, 'usual');
      expect(
        schedule.identifier![0].system,
        Uri.parse('http://example.org/scheduleid'),
      );
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
      expectEquals(
        schedule.actor![0].reference,
        'Location/bded1b2f-bdd5-424b-8725-4c6f3d525e07',
      );
      expectEquals(schedule.actor![0].display, 'Norte');
      expectEquals(
        schedule.actor![1].reference,
        'HealthcareService/70ab9bd6-ff24-4bfb-902f-86a5f47a2866',
      );
      expectEquals(schedule.actor![1].display, 'Medicina General');

      // Assert planning horizon
      expect(schedule.planningHorizon!.start, DateTime.utc(2023, 12));
      expect(
        schedule.planningHorizon!.end,
        DateTime.utc(2023, 12, 31, 23, 59, 59),
      );

      // Assert comment
      expect(
          schedule.comment,
          'Los SLOTS asociados a esta agenda, '
          'deberan estar asociados a Medicina General zona NORTE');
    });

    /// curl -X GET "https://hapi.fhir.org/baseR4/Slot?status=free&_count=10" -H "Accept: application/fhir+json"
    test('Slot Search', () async {
      final result = Resource.fromJson(
        jsonValueDecode(
          await File('test/responses/schedulcessearch.json').readAsString(),
        ) as JsonObject,
      ) as Bundle;

      final schedules =
          result.entry!.map((e) => e.resource! as Schedule).toFixedList();

      expect(schedules.length, 10);
      expect(schedules.first.id, '055fa740-99e1-4b42-a081-2e4030a2aa7a');
    });
  });

  group('getResource API Call Tests', () {
    Future<void> readOrganization(Client client) async {
      const path = 'baseR4/Organization/2640211';

      final result =
          await client.getResource<Organization>(baseUri, path) as Organization;

      expect(result.id, '2640211');
      expect(result.identifier!.first.type!.text, 'SNO');
    }

    test(
      'GET read Organization Mocked',
      () async => readOrganization(_mockClient('test/responses/readorg.json')),
    );

    test(
      'GET read Organization For Realsies',
      () async => readOrganization(Client()),
      skip: true,
    );

    test(
      'GET read Organization - Error For Realsies',
      () async {
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
      },
      skip: true,
    );

    test(
      'GET search Practitioner by Org For Realsies',
      () async {
        const path =
            'baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/fcf35f09-a2eb-324f-9ec6-40cdeadc9322&_count=10';
        final bundle =
            await Client().getResource<Bundle>(baseUri, path) as Bundle;

        final practitioners =
            bundle.entry!.map((e) => e.resource! as Practitioner).toFixedList();

        expect(practitioners.length, 1);
        expect(practitioners.first.id, '0000016f-a1db-e77f-0000-000000009ed4');
      },
      skip: true,
    );
  });

  group('http Client Extension Calls - Mocked', () {
    test('Encounter Search', () async {
      final bundleEntries = await _mockSearch<Encounter>(
        (c) async => await c.searchEncounters(
          baseUri,
          count: 10,
        ) as BundleEntries<Encounter>,
      );

      expect(bundleEntries.length, 2);

      expect(
        bundleEntries.bundle.entry!.first.fullUrl,
        Uri.parse('https://hapi.fhir.org/baseR4/Encounter/8728249'),
      );

      final first = bundleEntries.entries.first;

      expect(
        first.id,
        '8728249',
      );
    });

    test('Observation Search', () async {
      final bundleEntries = await _mockSearch(
        (c) async => await c.searchObservations(
          baseUri,
          count: 10,
        ) as BundleEntries<Observation>,
      );

      expect(bundleEntries.length, 10);

      expect(
        bundleEntries.bundle.entry![2].fullUrl,
        Uri.parse('https://hapi.fhir.org/baseR4/Observation/9391493'),
      );

      final first = bundleEntries.entries.first;

      // Assertions for each field in the JSON
      expect(first.id, '9391491');
      expectEquals(first.meta?.versionId, '1');
      expect(
        first.meta?.lastUpdated,
        DateTime.utc(2023,04,10,10,33,32,673),
      );
      expectEquals(first.meta?.source, '#nw7ecyTCXojBLbEq');
      expect(first.status, 'final');
      expect(first.category?.length, 1);
      expect(first.category?.first.coding?.length, 1);
      expect(
        first.category?.first.coding?.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/observation-category'),
      );
      expect(first.category?.first.coding?.first.code, 'vital-signs');
      expect(first.category?.first.coding?.first.display, 'vital-signs');
      expect(first.code?.coding?.length, 1);
      expect(first.code?.coding?.first.system, Uri.parse('http://loinc.org'));
      expect(first.code?.coding?.first.code, '8302-2');
      expect(first.code?.coding?.first.display, 'Body Height');
      expect(first.code?.text, 'Body Height');
      expect(first.subject?.reference, 'Patient/9391475');
      expect(first.encounter?.reference, 'Encounter/9391490');
      expect(
        first.effectiveDateTime ,
        DateTime.utc(2011,04,18,19,44,18),
      );
      expect(first.issued, DateTime.parse('2011-04-18T15:44:18.249-04:00'));
      expect(first.valueQuantity?.value, 179.30389202058845);
      expect(first.valueQuantity?.unit, 'cm');
      expect(
        first.valueQuantity?.system,
        Uri.parse('http://unitsofmeasure.org'),
      );
      expect(first.valueQuantity?.code, 'cm');

      final map = first.json;
      final firstObs = Observation.fromJson(map);

      expect(firstObs.id, '9391491');
      expectEquals(firstObs.meta?.versionId, '1');
      expectEquals(
        firstObs.meta?.lastUpdated,
        DateTime.parse('2023-04-10T10:33:32.673+00:00'),
      );
      expectEquals(firstObs.meta?.source, '#nw7ecyTCXojBLbEq');
      expect(firstObs.status, 'final');
      expect(firstObs.category?.length, 1);
      expect(firstObs.category?.first.coding?.length, 1);
      expect(
        firstObs.category?.first.coding?.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/observation-category'),
      );
      expect(firstObs.category?.first.coding?.first.code, 'vital-signs');
      expect(firstObs.category?.first.coding?.first.display, 'vital-signs');
      expect(firstObs.code?.coding?.length, 1);
      expect(
        firstObs.code?.coding?.first.system,
        Uri.parse('http://loinc.org'),
      );
      expect(firstObs.code?.coding?.first.code, '8302-2');
      expect(firstObs.code?.coding?.first.display, 'Body Height');
      expect(firstObs.code?.text, 'Body Height');
      expect(firstObs.subject?.reference, 'Patient/9391475');
      expect(firstObs.encounter?.reference, 'Encounter/9391490');
      expect(
        firstObs.effectiveDateTime == '2011-04-18T15:44:18-04:00',
        true,
      );
      expect(firstObs.issued, DateTime.parse('2011-04-18T15:44:18.249-04:00'));
      expect(firstObs.valueQuantity?.value, 179.30389202058845);
      expect(firstObs.valueQuantity?.unit, 'cm');
      expect(
        firstObs.valueQuantity?.system,
        Uri.parse('http://unitsofmeasure.org'),
      );
      expect(firstObs.valueQuantity?.code, 'cm');

      final entry = bundleEntries.entries[4];
      expect(entry.id, '9391495');
      expectEquals(entry.meta?.versionId, '1');
      expectEquals(
        entry.meta?.lastUpdated,
        DateTime.parse('2023-04-10T10:33:32.673+00:00'),
      );
      expectEquals(entry.meta?.source, '#nw7ecyTCXojBLbEq');
      expect(entry.status, 'final');
      expect(entry.category?.length, 1);
      expect(entry.category?.first.coding?.length, 1);
      expect(
        entry.category?.first.coding?.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/observation-category'),
      );
      expect(entry.category?.first.coding?.first.code, 'vital-signs');
      expect(entry.category?.first.coding?.first.display, 'vital-signs');
      expect(entry.code?.coding?.length, 1);
      expect(entry.code?.coding?.first.system, Uri.parse('http://loinc.org'));
      expect(entry.code?.coding?.first.code, '55284-4');
      expect(entry.code?.coding?.first.display, 'Blood Pressure');
      expect(entry.code?.text, 'Blood Pressure');
      expect(entry.subject?.reference, 'Patient/9391475');
      expect(entry.encounter?.reference, 'Encounter/9391490');
      expect(
        entry.effectiveDateTime == '2011-04-18T15:44:18-04:00',
        true,
      );
      expect(entry.issued, DateTime.parse('2011-04-18T15:44:18.249-04:00'));
      expect(entry.component?.length, 2);

      final diastolicComponent = entry.component?.firstWhere(
        (component) => component.code?.coding?.first.code == '8462-4',
      );
      expect(
        diastolicComponent?.code?.coding?.first.system,
        Uri.parse('http://loinc.org'),
      );
      expect(diastolicComponent?.code?.coding?.first.code, '8462-4');
      expect(
        diastolicComponent?.code?.coding?.first.display,
        'Diastolic Blood Pressure',
      );
      expect(diastolicComponent?.code?.text, 'Diastolic Blood Pressure');
      expect(diastolicComponent?.valueQuantity?.value, 73.88239013577947);
      expect(diastolicComponent?.valueQuantity?.unit, 'mm[Hg]');
      expect(
        diastolicComponent?.valueQuantity?.system,
        Uri.parse('http://unitsofmeasure.org'),
      );
      expect(diastolicComponent?.valueQuantity?.code, 'mm[Hg]');

      final systolicComponent = entry.component?.firstWhere(
        (component) => component.code?.coding?.first.code == '8480-6',
      );
      expect(
        systolicComponent?.code?.coding?.first.system,
        Uri.parse('http://loinc.org'),
      );
      expect(systolicComponent?.code?.coding?.first.code, '8480-6');
      expect(
        systolicComponent?.code?.coding?.first.display,
        'Systolic Blood Pressure',
      );
      expect(systolicComponent?.code?.text, 'Systolic Blood Pressure');
      expect(systolicComponent?.valueQuantity?.value, 130.9017025584741);
      expect(systolicComponent?.valueQuantity?.unit, 'mm[Hg]');
      expect(
        systolicComponent?.valueQuantity?.system,
        Uri.parse('http://unitsofmeasure.org'),
      );
      expect(systolicComponent?.valueQuantity?.code, 'mm[Hg]');

      final entryMap = entry.json;
      final entry2 = Observation.fromJson(entryMap);

      expect(entry2.id, '9391495');
      expectEquals(entry2.meta?.versionId, '1');
      expectEquals(
        entry2.meta?.lastUpdated,
        DateTime.parse('2023-04-10T10:33:32.673+00:00'),
      );
      expectEquals(entry2.meta?.source, '#nw7ecyTCXojBLbEq');
      expect(entry2.status, 'final');
      expect(entry2.category?.length, 1);
      expect(entry2.category?.first.coding?.length, 1);
      expect(
        entry2.category?.first.coding?.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/observation-category'),
      );
      expect(entry2.category?.first.coding?.first.code, 'vital-signs');
      expect(entry2.category?.first.coding?.first.display, 'vital-signs');
      expect(entry2.code?.coding?.length, 1);
      expect(entry2.code?.coding?.first.system, Uri.parse('http://loinc.org'));
      expect(entry2.code?.coding?.first.code, '55284-4');
      expect(entry2.code?.coding?.first.display, 'Blood Pressure');
      expect(entry2.code?.text, 'Blood Pressure');
      expect(entry2.subject?.reference, 'Patient/9391475');
      expect(entry2.encounter?.reference, 'Encounter/9391490');
      expectEquals(
        entry2.effectiveDateTime,
        '2011-04-18T15:44:18-04:00',
      );
      expect(entry2.issued, DateTime.parse('2011-04-18T15:44:18.249-04:00'));
      expect(entry2.component?.length, 2);

      final diastolicComponent2 = entry2.component?.firstWhere(
        (component) => component.code?.coding?.first.code == '8462-4',
      );
      expect(
        diastolicComponent2?.code?.coding?.first.system,
        Uri.parse('http://loinc.org'),
      );
      expect(diastolicComponent2?.code?.coding?.first.code, '8462-4');
      expect(
        diastolicComponent2?.code?.coding?.first.display,
        'Diastolic Blood Pressure',
      );
      expect(diastolicComponent2?.code?.text, 'Diastolic Blood Pressure');
      expect(diastolicComponent2?.valueQuantity?.value, 73.88239013577947);
      expect(diastolicComponent2?.valueQuantity?.unit, 'mm[Hg]');
      expect(
        diastolicComponent2?.valueQuantity?.system,
        Uri.parse('http://unitsofmeasure.org'),
      );
      expect(diastolicComponent2?.valueQuantity?.code, 'mm[Hg]');

      final systolicComponent2 = entry2.component?.firstWhere(
        (component) => component.code?.coding?.first.code == '8480-6',
      );
      expect(
        systolicComponent2?.code?.coding?.first.system,
        Uri.parse('http://loinc.org'),
      );
      expect(systolicComponent2?.code?.coding?.first.code, '8480-6');
      expect(
        systolicComponent2?.code?.coding?.first.display,
        'Systolic Blood Pressure',
      );
      expect(systolicComponent2?.code?.text, 'Systolic Blood Pressure');
      expect(systolicComponent2?.valueQuantity?.value, 130.9017025584741);
      expect(systolicComponent2?.valueQuantity?.unit, 'mm[Hg]');
      expect(
        systolicComponent2?.valueQuantity?.system,
        Uri.parse('http://unitsofmeasure.org'),
      );
      expect(systolicComponent2?.valueQuantity?.code, 'mm[Hg]');
    });

    test('Slot Search', () async {
      final bundleEntries = await _mockSearch<Slot>(
        (c) async => await c.searchSlots(
          baseUri,
          count: 10,
          status: 'free',
        ) as BundleEntries<Slot>,
      );

      expect(bundleEntries.length, 10);

      expect(
        bundleEntries.bundle.entry![2].fullUrl,
        Uri.parse('https://hapi.fhir.org/baseR4/Slot/52223'),
      );

      final first = bundleEntries.entries.first;

      expect(
        first.id,
        '41697',
      );

      final slot = bundleEntries.entries[2];

      expect(slot.id, '52223');

// Assert all fields (Thanks to Anthropic Claude 3)

      expectEquals(slot.meta?.versionId, '2');

      expectEquals(
        slot.meta?.lastUpdated,
        DateTime.utc(2022, 10, 5, 23, 41, 27, 908),
      );

      expectEquals(slot.meta?.source, '#Tvh7DyVNf71GZIci');
      expect(slot.identifier?.first.system, Uri.parse('urn:system'));
      expect(slot.identifier?.first.value, 'slot-0001');
      expect(
        slot.serviceCategory?.first.coding?.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/service-category'),
      );
      expect(slot.serviceCategory?.first.coding?.first.code, '17');
      expect(
        slot.serviceCategory?.first.coding?.first.display,
        'General Practice',
      );
      expect(
        slot.serviceType?.first.coding?.first.system,
        Uri.parse('http://terminology.hl7.org/CodeSystem/service-type'),
      );
      expect(slot.serviceType?.first.coding?.first.code, '57');
      expect(slot.serviceType?.first.coding?.first.display, 'Immunization');
      expect(
        slot.specialty?.first.coding?.first.system,
        Uri.parse('http://snomed.info/sct'),
      );
      expect(slot.specialty?.first.coding?.first.code, '408480009');
      expect(
        slot.specialty?.first.coding?.first.display,
        'Clinical immunology',
      );
      expect(
        slot.appointmentType?.coding?.first.system,
        Uri.parse('http://hl7.org/fhir/v2/0276'),
      );
      expect(slot.appointmentType?.coding?.first.code, 'WALKIN');
      expect(
        slot.appointmentType?.coding?.first.display,
        'A previously unscheduled walk-in visit',
      );
      expect(slot.status, 'free');
      //TODO: investigate these...
      //Why is the datetime like this?
      expect(slot.start, DateTime.parse('2019-10-30T15:00:00-07:00'));
      expect(slot.end, DateTime.parse('2019-10-30T16:00:00-07:00'));
      expect(
        slot.comment,
        'Assessments should be performed before requesting appointments '
        'in this slot.',
      );
    });

    test('Patient Search', () async {
      final bundleEntries = await _mockSearch<Patient>(
        (c) async => await c.searchPatients(
          baseUri,
          count: 2,
        ) as BundleEntries<Patient>,
      );

      expect(bundleEntries.length, 2);

      expect(
        bundleEntries.bundle.entry!.first.fullUrl,
        Uri.parse('https://hapi.fhir.org/baseR4/Patient/8728293'),
      );

      final first = bundleEntries.entries.first;

      expect(
        first.id,
        '8728293',
      );

      final patient = bundleEntries.entries[1];

      expect(patient.id, '8728374');

      expect(first.id, '8728293');
      expectEquals(first.meta!.versionId, '1');
      expectEquals(
        first.meta!.lastUpdated,
        DateTime.parse('2023-03-21T10:42:21.276+00:00'),
      );
      expectEquals(first.meta!.source, '#atCUOwuOCtijIb20');

      //HAPI has a list of texts, but these don't seem to be in the
      //FHIR spect
      // expect(first.text!.status, 'generated');
      // expect(first.text!.div,
      //     '<div xmlns="http://www.w3.org/1999/xhtml">Ruben Manzaneque</div>');

      expect(first.identifier!.length, 1);
      expect(
        first.identifier!.first.system,
        Uri.parse('http://clinfhir.com/fhir/NamingSystem/identifier'),
      );
      expect(first.identifier!.first.value, '0987654321');
      expect(first.name!.length, 1);
      expect(first.name!.first.use, 'official');
      // expect(first.name!.first.text, 'Ruben Manzaneque');
      expect(first.name!.first.family, 'Manzaneque');
      expect(first.name!.first.given!.length, 1);
      expect(first.name!.first.given!.first, 'Ruben');
      expect(first.gender, AdministrativeGender.male);
      expect(first.birthDate, DateTime.parse('1992-10-12'));

      expect(patient.id, '8728374');
      expectEquals(patient.meta!.versionId, '1');
      expectEquals(
        patient.meta!.lastUpdated,
        DateTime.parse('2023-03-21T10:42:27.116+00:00'),
      );
      expectEquals(patient.meta!.source, '#sPvtkIxUA0WunOfK');
      // expect(patient.text!.status, 'generated');
      // expect(
      //   patient.text!.div,
      //   '<div xmlns="http://www.w3.org/1999/xhtml">Lucas Morris</div>',
      // );
      expect(patient.identifier!.length, 1);
      expect(
        patient.identifier!.first.system,
        Uri.parse('http://clinfhir.com/fhir/NamingSystem/identifier'),
      );
      expect(patient.identifier!.first.value, '4241697');
      expect(patient.name!.length, 1);
      // expect(patient.name!.first.use, 'official');
      // expect(patient.name!.first.text, 'Lucas Morris');
      expect(patient.name!.first.family, 'Morris');
      expect(patient.name!.first.given!.length, 1);
      expect(patient.name!.first.given!.first, 'Lucas');
      expect(patient.gender, AdministrativeGender.male);
      expect(patient.birthDate, DateTime.parse('1985-01-23'));

      final map = first.json;
      expect(map['id'], '8728293');
      expect(map['resourceType'], 'Patient');

      // ignore_for_block: avoid_dynamic_calls
      expect(map['meta']['versionId'], '1');
      expect(
        map['meta']['lastUpdated'],
        '2023-03-21T10:42:21.276+00:00',
      );
      expect(map['meta']['source'], '#atCUOwuOCtijIb20');
      // expect(map['text']['status'], 'generated');
      // expect(
      //   map['text']['div'],
      //   '<div xmlns="http://www.w3.org/1999/xhtml">Ruben Manzaneque</div>',
      // );
      expect((map['identifier'] as JsonArray).value.length, 1);
      expect(
        (map['identifier'] as JsonArray).value[0]['system'],
        'http://clinfhir.com/fhir/NamingSystem/identifier',
      );
      expect((map['identifier'] as JsonArray).value[0]['value'], '0987654321');
      final nameArray = (map['name'] as JsonArray).value;
      expect(nameArray.length, 1);
      final firstName = nameArray[0];
      expect(firstName['use'], 'official');
      // expect(map['name'][0]['text'], 'Ruben Manzaneque');
      expect(firstName['family'], 'Manzaneque');
      expect((firstName['given'] as JsonArray).value.length, 1);
      expect((firstName['given'] as JsonArray).value[0], 'Ruben');
      // end of block to ignore rules
      expect(map['gender'], 'male');
      expect(map['birthDate'], '1992-10-12T00:00:00.000');
    });
  });

  group(
    'http Client Extension Calls - For Real',
    () {
      test('searchAppointments By Status', () async {
        //curl -X GET "https://hapi.fhir.org/baseR4/Appointment?_count=10&status=booked" -H "Accept: application/fhir+json"

        final result = await Client().searchAppointments(
          baseUri,
          count: 10,
          status: 'booked',
        );

        final bundleEntries = result as BundleEntries<Appointment>;

        expect(bundleEntries.length, 10);
        expect(
          bundleEntries.entries.first.id,
          '1829',
        );
        expect(
          bundleEntries.entries.first.status,
          'booked',
        );
      });

      test('searchPractitionerRoles Success', () async {
        final result =
            await Client().searchPractitionerRoles(baseUri, count: 10);

        final bundleEntries = result as BundleEntries<PractitionerRole>;

        expect(bundleEntries.length, 10);
        expect(
          bundleEntries.entries.first.id,
          '000-a24198ce-1b4b-4364-9dd4-03b3c5b5bd41-PractitionerRole',
        );
      });

      test('searchSchedules Success', () async {
        final result = await Client().searchSchedules(baseUri, count: 10);

        final bundleEntries = result as BundleEntries<Schedule>;

        expect(bundleEntries.length, 10);
        expect(bundleEntries.entries[9].id, '10434942');
      });

      test('searchSchedules Error', () async {
        final result = await Client()
            //Note the bad URL
            .searchSchedules('$baseUri/broken/', count: 10);

        final oo = result as OperationOutcome<Schedule>;

        expect(
          oo.text!.status,
          'Exception or Error occurred when converting JSON to Resource',
        );
      });
    },
    skip: true,
  );
}

Future<BundleEntries<T>> _mockSearch<T>(
  Future<BundleEntries<T>> Function(MockClient client) getBundeEntries,
) async =>
    getBundeEntries(
      _mockClient('test/responses/${T.toString().toLowerCase()}search.json'),
    );

MockClient _mockClient(String filePath) => MockClient(
      (r) => Future.value(
        Response(
          File(filePath).readAsStringSync(),
          200,
        ),
      ),
    );

void expectEquals<T>(T a, T b) => expect(a == b, true);
