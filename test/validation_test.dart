// ignore_for_file: avoid_print

import 'dart:io';

import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';
import 'package:test/test.dart';

void main() {
  group('Appointment Validation', () {
    test('Validate Appointment Search Results', () async {
      final json =
          await File('test/responses/appointmentsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      for (final entry in result.entry!) {
        final appointment = entry.resource! as Appointment;

        // ignore: unused_local_variable
        final validationResult =
            validate(Appointment.fieldDefinitions, appointment);

        switch (appointment.id) {
          case '059200e9f1d3e606':
          case '06a86ef2-fd0a-42cb-b2a6-e1076670bc3b':
          case '05fda0d9-7d96-4869-bccd-8976ed9f35d8':
          case '07b726df-aa16-471d-ac8d-a69c10f73ee8':
          case '0a391b16-653c-4281-9a55-ff14d1ac94bf':
            expect(validationResult.isValid, false);
            expectFieldStatusError(validationResult);
            expect(validationResult.errorMessages.length, 1);

          case '0a391b16-653c-4281-9a55-ff14d1ac94ba':
            expect(validationResult.isValid, false);
            expectFieldStatusError(validationResult);
            expect(validationResult.errorMessages.length, 2);

          default:
            expect(validationResult.isValid, isTrue);
        }

        print(validationResult);
      }
    });
  });
}

void expectFieldStatusError(ValidationResult validationResult) {
  expect(
    validationResult.errorMessages.first.message,
    'Field status is required',
  );
  expect(
    validationResult.errorMessages.first.field,
    'status',
  );
}
