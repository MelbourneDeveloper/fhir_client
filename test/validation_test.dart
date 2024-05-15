// ignore_for_file: avoid_print

import 'dart:io';

import 'package:fhir_client/models/resource.dart';
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
      final json =
          await File('test/responses/patientsearch.json').readAsString();
      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      for (final entry in result.entry!) {
        final patient = entry.resource! as Patient;
        final validationResult = patient.validate(Patient.fieldDefinitions);

        switch (patient.id) {
          case '8728293':
          case '8728374':
            expect(validationResult.isValid, false);
            expectMessage(
              validationResult,
              'text',
              'Field text is not allowed',
            );
            expect(validationResult.errorMessages.length, 1);
          default:
            expect(validationResult.isValid, true);
        }

        print(validationResult);
      }
    });
  });
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
