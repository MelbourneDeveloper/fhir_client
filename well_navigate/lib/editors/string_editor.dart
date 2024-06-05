import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/text_field_formatted.dart';

class StringEditor<T> extends StatelessWidget {
  const StringEditor({
    required this.element,
    required this.fieldDefinition,
    required this.onChanged,
    super.key,
  });

  final JsonObject element;
  final FieldDefinition<T> fieldDefinition;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => TextFieldFormatted(
        labelText: fieldDefinition.display ?? fieldDefinition.name,
        controller: TextEditingController(
          text: switch (fieldDefinition.getValue(element)) {
            final String s => s,
            final num s => s.toString(),
            _ => '',
          },
        ),
        onChanged: onChanged,
      );
}
