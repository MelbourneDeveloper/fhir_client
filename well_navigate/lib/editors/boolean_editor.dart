import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/ui_functions.dart';

class BooleanEditor<T> extends StatelessWidget {
  const BooleanEditor({
    required this.element,
    required this.fieldDefinition,
    required this.onChanged,
    super.key,
  });

  final JsonObject element;
  final FieldDefinition<T> fieldDefinition;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Container(
        decoration: standardFieldBoxDecoration(context),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                fieldDefinition.display ?? fieldDefinition.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            standardHorizontalSpacer,
            Checkbox(
              tristate: true,
              value: switch (fieldDefinition.getValue(element)) {
                final bool d => d,
                _ => null,
              },
              onChanged: (value) => onChanged(value.toString()),
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
