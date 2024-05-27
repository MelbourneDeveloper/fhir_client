// ignore_for_file: strict_raw_type

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/validation/field_definition.dart';

const _primitiveFieldTypes = [
  FieldDefinition<String>,
  FieldDefinition<int>,
  FieldDefinition<num>,
  FieldDefinition<DateTime>,
];

extension FieldDefinitionListExtensions on List<FieldDefinition> {
  // ignore: strict_raw_type
  List<FieldDefinition> primitiveFields() => where(
        (fd) => _primitiveFieldTypes.contains(fd.runtimeType),
      ).toFixedList();

  // ignore: strict_raw_type
  List<FieldDefinition> nonPrimitiveFields() => where(
        (fd) => !_primitiveFieldTypes.contains(fd.runtimeType),
      ).toFixedList();
}
