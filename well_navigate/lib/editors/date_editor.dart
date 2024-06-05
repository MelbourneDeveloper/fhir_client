import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';

/// Not working properly...
class DateEditor<T> extends StatelessWidget {
  const DateEditor({
    required this.element,
    required this.fieldDefinition,
    required this.onChanged,
    super.key,
  });

  final JsonObject element;
  final FieldDefinition<T> fieldDefinition;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => InputDatePickerFormField(
        fieldLabelText: fieldDefinition.display ?? fieldDefinition.name,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030),
        initialDate: switch (fieldDefinition.getValue(element)) {
          final DateTime d => d,
          _ => null,
        },
        onDateSubmitted: (value) => onChanged(value.toIso8601String()),
      );
}
