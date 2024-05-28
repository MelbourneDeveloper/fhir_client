// ignore_for_file: strict_raw_type

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/value_sets/appointment_status.dart';
import 'package:fhir_client/models/value_sets/language.dart';
import 'package:fhir_client/validation/field_definition.dart';

const _primitiveFieldTypes = [
  FieldDefinition<String>,
  FieldDefinition<int>,
  FieldDefinition<num>,
  FieldDefinition<DateTime>,
  FieldDefinition<AppointmentStatus>,
  FieldDefinition<Language>,
];

extension FieldDefinitionListExtensions on List<FieldDefinition> {
  // ignore: strict_raw_type
  FixedList<FieldDefinition> primitiveFields() => where(
        (fd) => _primitiveFieldTypes.contains(fd.runtimeType),
      ).toFixedList();

  // ignore: strict_raw_type
  FixedList<FieldDefinition> nonPrimitiveFields() => where(
        (fd) => !_primitiveFieldTypes.contains(fd.runtimeType),
      ).toFixedList();
}
