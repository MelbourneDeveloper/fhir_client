import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/editors/string_editor.dart';
import 'package:well_navigate/editors/value_set_editor.dart';
import 'package:well_navigate/field.dart';

/// The body of a panel, which has one or more field editors
class ElementPanel extends StatelessWidget {
  const ElementPanel({
    required this.fields,
    required this.element,
    required this.onFieldChanged,
    super.key,
  });

  // ignore: strict_raw_type
  final List<FieldDefinition> fields;
  final JsonObject element;

  /// One of the fields on the panel changed
  final void Function(String field, JsonValue jsonValue) onFieldChanged;

  @override
  Widget build(BuildContext context) => Wrap(
        children: fields.map(_field).toList(),
      );

  Widget _field<T>(FieldDefinition<T> fieldDefinition) => Field(
        fieldDefinition: fieldDefinition,
        editor: _editorByType(fieldDefinition),
      );

  Widget _editorByType(FieldDefinition<dynamic> fieldDefinition) =>
      switch (fieldDefinition) {
        FieldDefinition<String>() => StringEditor(
            fieldDefinition: fieldDefinition,
            element: element,
            onChanged: (v) =>
                onFieldChanged(fieldDefinition.name, JsonString(v)),
          ),
        FieldDefinition<ValueSetConcept>() => ValueSetEditor(
            items: fieldDefinition.valueSetValues!
                .cast<ValueSetConcept>()
                .toFixedList(),
            selectedValue: fieldDefinition.getValue(element),
          ),
        _ => StringEditor(
            fieldDefinition: fieldDefinition,
            element: element,
            onChanged: (v) =>
                onFieldChanged(fieldDefinition.name, JsonString(v)),
          ),
      };
}
