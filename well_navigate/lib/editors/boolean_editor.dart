import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/resource_editor/field_input_decorator.dart';

class BooleanEditor<T> extends StatelessWidget {
  const BooleanEditor({
    required this.element,
    required this.fieldDefinition,
    required this.onChanged,
    super.key,
  });

  final JsonObject element;
  final FieldDefinition<T> fieldDefinition;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) => FieldInputDecorator(
        labelText: fieldDefinition.display ?? fieldDefinition.name,
        child: Row(
          children: [
            Checkbox(
              tristate: true,
              value: switch (fieldDefinition.getValue(element)) {
                final bool d => d,
                _ => false,
              },
              onChanged: onChanged,
            ),
            const SizedBox(width: 8),
            Text(
              fieldDefinition.getValue(element) == true ? 'Yes' : 'No',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
}
