import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';

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
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          labelText: fieldDefinition.display ?? fieldDefinition.name,
        ),
        controller: TextEditingController(
          text: fieldDefinition.getValue(element).toString(),
        ),
        onChanged: onChanged,
      );
}
