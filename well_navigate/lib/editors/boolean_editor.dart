import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/constants.dart';

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
  Widget build(BuildContext context) => Row(
        children: [
          Text(fieldDefinition.display ?? fieldDefinition.name),
          standardHorizontalSpacer,
          Checkbox(
            tristate: true,
            value: switch (fieldDefinition.getValue(element)) {
              final bool d => d,
              _ => null,
            },
            onChanged: (value) => onChanged(value.toString()),
          ),
        ],
      );
}
