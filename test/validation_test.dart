// ignore_for_file: avoid_print

import 'dart:io';

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/administrative_gender.dart';
import 'package:fhir_client/models/value_sets/appointment_status.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Search Results', () {
    test('Validate Appointment Search Results', () async {
      final json =
          await File('test/responses/appointmentsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      for (final entry in result.entry!) {
        final appointment = entry.resource! as Appointment;

        // ignore: unused_local_variable
        final validationResult =
            appointment.validate(Appointment.fieldDefinitions);

        switch (appointment.id) {
          case '059200e9f1d3e606':
            expect(validationResult.isValid, false);
            expectFieldStatusError(validationResult);
            expect(validationResult.errorMessages.length, 2);

            expect(
              validationResult.errorMessages
                  .firstWhere((element) => element.field == 'participant')
                  .message,
              'Field participant must be an array',
            );

          case '06a86ef2-fd0a-42cb-b2a6-e1076670bc3b':
          case '05fda0d9-7d96-4869-bccd-8976ed9f35d8':
          case '07b726df-aa16-471d-ac8d-a69c10f73ee8':
          case '0a391b16-653c-4281-9a55-ff14d1ac94bf':
            expect(validationResult.isValid, false);
            expectFieldStatusError(validationResult);
            expect(validationResult.errorMessages.length, 2);

          case '0a391b16-653c-4281-9a55-ff14d1ac94ba':
            expect(validationResult.isValid, false);
            expect(
                validationResult.errorMessages
                    .firstWhere((element) => element.field == 'status')
                    .message,
                'Field status value must be one of '
                '[ proposed, booked, arrived, fulfilled, cancelled, '
                'noshow, entered-in-error ]');

            expectMessage(validationResult, 'asd', 'Field asd is not allowed');

            expect(validationResult.errorMessages.length, 3);

          default:
            expect(validationResult.isValid, isTrue);
        }

        print(validationResult);
      }
    });

    test('Validate Patient Search Results', () async {
      for (final patient in await getResources<Patient>()) {
        final validationResult = patient.validate(Patient.fieldDefinitions);

        switch (patient.id) {
          case '8728374':
            expect(validationResult.isValid, false);
            expectMessage(
              validationResult,
              'texty',
              'Field texty is not allowed',
            );
            expect(validationResult.errorMessages.length, 1);
          default:
            expect(validationResult.isValid, true);
        }

        print(validationResult);
      }
    });
  });

  group('Validate Constructed Instances', () {
    test('Validate Constructed Appointment Instances', () {
      final appointment1 = Appointment(id: '123');
      final validationResult1 =
          appointment1.validate(Appointment.fieldDefinitions);
      expect(validationResult1.isValid, false);
      expectFieldStatusError(validationResult1);
      expect(validationResult1.errorMessages.length, 2);
      expect(
        validationResult1.errorMessages
            .firstWhere((element) => element.field == 'participant')
            .message,
        'Field participant is required, but no value was specified',
      );

      final appointment2 = Appointment(
        id: '456',
        status: AppointmentStatus.proposed,
      );
      final validationResult2 =
          appointment2.validate(Appointment.fieldDefinitions);
      expect(validationResult2.isValid, false);
      expect(
        validationResult1.errorMessages
            .firstWhere((element) => element.field == 'participant')
            .message,
        'Field participant is required, but no value was specified',
      );
    });

    test('Min Cardinality', () {
      final appointment = Appointment(
        id: '789',
        status: AppointmentStatus.booked,
        participant: FixedList([]),
      );

      final validationResult =
          appointment.validate(Appointment.fieldDefinitions);
          
      expect(validationResult.isValid, false);
      expect(
        validationResult.errorMessages
            .firstWhere((element) => element.field == 'participant')
            .message,
        'Field participant must have at least 1 items',
      );
    });

    test('Validate Constructed Patient Instances', () {
      final patient1 = Patient(id: '123');
      final validationResult1 = patient1.validate(Patient.fieldDefinitions);
      expect(validationResult1.isValid, true);

      final patient2 = Patient(
        id: '456',
        gender: AdministrativeGender.male,
        birthDate: DateTime(2000),
        active: true,
      );
      final validationResult2 = patient2.validate(Patient.fieldDefinitions);
      expect(validationResult2.isValid, true);

      final patient3 = Patient(
        id: '789',
        gender: AdministrativeGender.unknown,
        birthDate: DateTime(2000),
        active: false,
      ).withFieldValue(
        FieldDefinition(name: 'superfluous', getValue: (a) => true),
        const JsonString('field'),
        constructor: Patient.fromJson,
      );
      final validationResult3 = patient3.validate(Patient.fieldDefinitions);
      expect(validationResult3.isValid, false);
      expectMessage(
        validationResult3,
        'superfluous',
        'Field superfluous is not allowed',
      );
      expect(validationResult3.errorMessages.length, 1);
    });
  });
}

Future<FixedList<T>> getResources<T>() async {
  final json =
      await File('test/responses/${T.toString().toLowerCase()}search.json')
          .readAsString();
  final result =
      Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

  return FixedList(
    result.entry!.map((e) => e.resource! as T),
  );
}

void expectFieldStatusError(ValidationResult validationResult) {
  expectMessage(
    validationResult,
    'status',
    'Field status is required, but no value was specified',
  );
  expect(
    validationResult.errorMessages.first.field,
    'status',
  );
}

void expectMessage(
  ValidationResult validationResult,
  String field,
  String message,
) =>
    expect(
      validationResult.errorMessages
          .firstWhere((element) => element.field == field)
          .message,
      message,
    );
