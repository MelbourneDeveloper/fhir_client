import 'dart:io';

import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';
import 'package:test/test.dart';

void main() {
  group('Appointment Validation', () {
    test('Appointment Search Results', () async {
      final json =
          await File('test/responses/appointmentsearch.json').readAsString();

      final result =
          Resource.fromJson(jsonValueDecode(json) as JsonObject) as Bundle;

      final actual = result.entry!.first.resource! as Appointment;

      // ignore: unused_local_variable
      final validationResult = validate(Appointment.fieldDefinitions, actual);
      expect(validationResult.isValid, isTrue);

      // ignore: avoid_print
      print(validationResult);
    });
  });
}
