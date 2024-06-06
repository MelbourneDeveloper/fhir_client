import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';

//TODO: These are dangerous. Fix.
final _minDate = DateTime(1990);
final _maxDate = DateTime(2030);

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
        firstDate: _minDate,
        lastDate: _maxDate,
        initialDate: switch (fieldDefinition.getValue(element)) {
          (final DateTime d)
              when d.millisecondsSinceEpoch > _minDate.microsecondsSinceEpoch &&
                  d.millisecondsSinceEpoch < _maxDate.millisecondsSinceEpoch =>
            d,
          _ => null,
        },
        onDateSubmitted: (value) => onChanged(value.toIso8601String()),
      );
}
