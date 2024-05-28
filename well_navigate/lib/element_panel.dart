import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/resource.dart' as res;
import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/editors/string_editor.dart';
import 'package:well_navigate/editors/value_set_editor.dart';
import 'package:well_navigate/field.dart';

class ElementPanel extends StatelessWidget {
  const ElementPanel({
    required this.fields,
    required this.element,
    super.key,
  });

  // ignore: strict_raw_type
  final List<FieldDefinition> fields;
  final res.Element element;

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
        FieldDefinition<String>() => TextField(
            decoration: InputDecoration(
              labelText: fieldDefinition.display ?? fieldDefinition.name,
            ),
            controller: TextEditingController(
              text: fieldDefinition.getValue(element.json).toString(),
            ),
          ),
        FieldDefinition<ValueSetConcept>() => ValueSetEditor(
            items: fieldDefinition.valueSetValues!
                .cast<ValueSetConcept>()
                .toFixedList(),
            selectedValue: fieldDefinition.getValue(element.json),
          ),
        _ => StringEditor(
            fieldDefinition: fieldDefinition,
            element: element,
          ),
      };
}
