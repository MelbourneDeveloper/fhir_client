import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/editors/string_editor.dart';
import 'package:well_navigate/editors/value_set_editor.dart';
import 'package:well_navigate/resource_editor/field.dart';

/// The body of a panel, which has one or more field editors
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
        children: fields.map(_field).toList(),
      );

  Widget _field<T>(FieldDefinition<T> fieldDefinition) => Field(
        fieldDefinition: fieldDefinition,
        editor: _editorByType(fieldDefinition),
      );

  Widget _editorByType(FieldDefinition<dynamic> fieldDefinition) =>
      switch (fieldDefinition) {
        FieldDefinition<String>(name: 'div') => HtmlWidget(
            fieldDefinition.getValue(panelElement) ?? '<div></div>',
          ),
        FieldDefinition<String>() => StringEditor(
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
