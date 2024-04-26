import 'dart:convert';
import 'dart:io';

import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/administrative_gender.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

const baseUri = 'http://hapi.fhir.org/';

void main() {
  group('Deserialization Tests', () {
    test('Appointment Search', () async {
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

      // Assert ID
      expect(appointment.id, '05fda0d9-7d96-4869-bccd-8976ed9f35d8');

      // Assert meta
      expect(appointment.meta!.versionId, '1');
      final expectedLastUpdated = DateTime.utc(2023, 08, 04, 8, 59, 32, 432);
      expect(
        appointment.meta!.lastUpdated,
        expectedLastUpdated,
      );

      // Assert search mode
      expect(result.entry![2].search!.mode, 'match');

      final map = appointment.meta!.toJson();
      final meta = Meta.fromJson(map);
      expect(meta.lastUpdated, expectedLastUpdated);
    });

    test('OperationOutcome', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Practitioner?_has:PractitionerRole:practitioner:organization=Organization/fcf35f09-a2eb-324f-9ec6-40cdeadc9322&_count=10" -H "Content-Type: application/json"
      final json =
          await File('test/responses/errorresponse.json').readAsString();

      final result = Resource.fromJson(jsonDecode(json) as Map<String, dynamic>)
          as OperationOutcome;

      expect(result.issue!.first.severity, 'error');
    });

    test('Organization Read', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/Organization/2640211" -H "Content-Type: application/json"
      final json = await File('test/responses/readorg.json').readAsString();

      final org =
          Organization.fromJson(jsonDecode(json) as Map<String, dynamic>);

      expect(org.id, '2640211');
      expect(org.identifier!.first.type!.text, 'SNO');

      final map = org.toJson();

      expect(map['id'], '2640211');
    });

    test('Organization Search result', () async {
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
        Uri.parse('http://miup.jp/bangladesh/organization-type'),
      );

      expect(org.id, '2640211');

      expect(org.meta!.versionId, '1');
      expect(org.meta!.lastUpdated, DateTime.utc(2021, 10, 13, 7, 52, 35, 268));
      expect(org.meta!.source, '#VAvOSFPlfBChwJZ4');

      expect(org.identifier!.length, 1);
      expect(org.identifier!.first.type!.text, 'SNO');
      expect(org.identifier!.first.system, 'http://miup.jp/bangladesh/mej2021');
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
    });

    test('Practitioner Search result', () async {
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
        DateTime.utc(2020, 03, 24, 17, 59, 12, 935),
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

      final map = practitioner.toJson();
      final clonedPractitioner = Practitioner.fromJson(map);

      expect(clonedPractitioner.gender, AdministrativeGender.male);
    });

    test('PractitionerRole Search', () async {
      //curl -X GET "http://hapi.fhir.org/baseR4/PractitionerRole?_count=10" -H "Content-Type: application/json"
      final json = await File('test/responses/practicionerrolesearch.json')
          .readAsString();

      final result = Bundle.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final entries = result.entry!.toList();

      expect(entries.length, 10);

      expect(
        entries.first.resource!.id,
        '000-a24198ce-1b4b-4364-9dd4-03b3c5b5bd41-PractitionerRole',
      );

      final pr = entries.first.resource! as PractitionerRole;

      expect(
        pr.extension!.first.url,
        Uri.parse(
          'http://pdx.bcbs.com/providerdataexchange/StructureDefinition/providerdisplay',
        ),
      );
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
          Resource.fromJson(jsonDecode(json) as Map<String, dynamic>) as Bundle;

      final schedules =
          result.entry!.map((e) => e.resource! as Schedule).toList();

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
        jsonDecode(
          await File('test/responses/schedulcessearch.json').readAsString(),
        ) as Map<String, dynamic>,
      ) as Bundle;

      final schedules =
          result.entry!.map((e) => e.resource! as Schedule).toList();

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
            bundle.entry!.map((e) => e.resource! as Practitioner).toList();

        expect(practitioners.length, 1);
        expect(practitioners.first.id, '0000016f-a1db-e77f-0000-000000009ed4');
      },
      skip: true,
    );
  });

  group('http Client Extension Calls - Mocked', () {
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

      expect(slot.meta?.versionId, '2');

      expect(
        slot.meta?.lastUpdated,
        DateTime.utc(2022, 10, 5, 23, 41, 27, 908),
      );

      expect(slot.meta?.source, '#Tvh7DyVNf71GZIci');
      expect(slot.identifier?.first.system, 'urn:system');
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
      expect(first.meta!.versionId, '1');
      expect(
        first.meta!.lastUpdated,
        DateTime.parse('2023-03-21T10:42:21.276+00:00'),
      );
      expect(first.meta!.source, '#atCUOwuOCtijIb20');

      //HAPI has a list of texts, but these don't seem to be in the
      //FHIR spect
      // expect(first.text!.status, 'generated');
      // expect(first.text!.div,
      //     '<div xmlns="http://www.w3.org/1999/xhtml">Ruben Manzaneque</div>');

      expect(first.identifier!.length, 1);
      expect(
        first.identifier!.first.system,
        'http://clinfhir.com/fhir/NamingSystem/identifier',
      );
      expect(first.identifier!.first.value, '0987654321');
      expect(first.name!.length, 1);
      // expect(first.name!.first.use, 'official');
      // expect(first.name!.first.text, 'Ruben Manzaneque');
      expect(first.name!.first.family, 'Manzaneque');
      expect(first.name!.first.given!.length, 1);
      expect(first.name!.first.given!.first, 'Ruben');
      expect(first.gender, AdministrativeGender.male);
      expect(first.birthDate, DateTime.parse('1992-10-12'));


      expect(patient.id, '8728374');
      expect(patient.meta!.versionId, '1');
      expect(
        patient.meta!.lastUpdated,
        DateTime.parse('2023-03-21T10:42:27.116+00:00'),
      );
      expect(patient.meta!.source, '#sPvtkIxUA0WunOfK');
      // expect(patient.text!.status, 'generated');
      // expect(
      //   patient.text!.div,
      //   '<div xmlns="http://www.w3.org/1999/xhtml">Lucas Morris</div>',
      // );
      expect(patient.identifier!.length, 1);
      expect(
        patient.identifier!.first.system,
        'http://clinfhir.com/fhir/NamingSystem/identifier',
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
