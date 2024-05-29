import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';

class Field<T> extends StatelessWidget {
  const Field({
    required this.editor,
    required this.fieldDefinition,
    super.key,
  });

  final Widget editor;
  final FieldDefinition<T> fieldDefinition;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 350,
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 300,
                child: Tooltip(
                  message: fieldDefinition.description ?? fieldDefinition.name,
                  child: editor,
                ),
              ),
            ),
          ],
        ),
      );
}
