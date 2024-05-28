import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';

class StringEditor<T> extends StatelessWidget {
  const StringEditor({
    required this.element,
    required this.fieldDefinition,
    super.key,
  });

  final JsonObject element;
  final FieldDefinition<T> fieldDefinition;

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          labelText: fieldDefinition.display ?? fieldDefinition.name,
        ),
        controller: TextEditingController(
          text: fieldDefinition.getValue(element).toString(),
        ),
      );
}
