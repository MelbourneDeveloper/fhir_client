import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/editors/boolean_editor.dart';
import 'package:well_navigate/editors/date_editor.dart';
import 'package:well_navigate/editors/html_editor.dart';
import 'package:well_navigate/editors/string_editor.dart';
import 'package:well_navigate/editors/value_set_editor.dart';
import 'package:well_navigate/resource_editor/field.dart';

/// The body of the element panel, which has one or more field editors
class ElementPanel extends StatelessWidget {
  const ElementPanel({
    required this.fields,
    required this.panelElement,
    required this.onFieldChanged,
    super.key,
  });

  // ignore: strict_raw_type
  final List<FieldDefinition> fields;
  final JsonObject panelElement;

  /// One of the fields on the panel changed
  final void Function(String field, JsonValue jsonValue) onFieldChanged;

  @override
  Widget build(BuildContext context) => Wrap(
        runSpacing: standardPaddingValue,
        spacing: standardPaddingValue,
        children: fields.map(_field).toList(),
      );

  Widget _field<T>(FieldDefinition<T> fieldDefinition) => Field(
        fieldDefinition: fieldDefinition,
        editor: _editorByType(fieldDefinition),
      );

  Widget _editorByType(FieldDefinition<dynamic> fieldDefinition) =>
      switch (fieldDefinition) {
        //Why doesn't this show up as HTML?
        FieldDefinition<String>(name: 'div') => HtmlEditor(
            fieldDefinition: fieldDefinition,
            element: panelElement,
            onChanged: (v) =>
                onFieldChanged(fieldDefinition.name, JsonString(v)),
          ),
        FieldDefinition<String>() => StringEditor(
            fieldDefinition: fieldDefinition,
            element: panelElement,
            onChanged: (v) =>
                onFieldChanged(fieldDefinition.name, JsonString(v)),
          ),
        FieldDefinition<bool>() => BooleanEditor(
            fieldDefinition: fieldDefinition,
            element: panelElement,
            onChanged: (v) => onFieldChanged(
              fieldDefinition.name,
              v != null ? JsonBoolean(v) : const JsonNull(),
            ),
          ),
        FieldDefinition<DateTime>() => DateEditor(
            fieldDefinition: fieldDefinition,
            element: panelElement,
            onChanged: (v) =>
                onFieldChanged(fieldDefinition.name, JsonString(v)),
          ),
        FieldDefinition<ValueSetConcept>() => ValueSetEditor(
            fieldDefinition: fieldDefinition,
            selectedValue: fieldDefinition.getValue(panelElement),
          ),
        _ => StringEditor(
            fieldDefinition: fieldDefinition,
            element: panelElement,
            onChanged: (v) =>
                onFieldChanged(fieldDefinition.name, JsonString(v)),
          ),
      };
}
