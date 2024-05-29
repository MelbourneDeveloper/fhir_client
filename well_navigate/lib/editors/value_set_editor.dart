import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/helpers/iterable_extensions.dart';

class ValueSetEditor<T> extends StatelessWidget {
  const ValueSetEditor({
    required this.fieldDefinition,
    super.key,
    this.selectedValue,
  });

  final ValueSetConcept? selectedValue;
  final FieldDefinition<T> fieldDefinition;

  @override
  Widget build(BuildContext context) => InputDecorator(
        decoration: InputDecoration(
          label: Text(fieldDefinition.display ?? fieldDefinition.name),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<ValueSetConcept>(
            items: fieldDefinition.valueSetValues!
                .cast<ValueSetConcept>()
                .toSortedList((a, b) => a.compareTo(b))
                .map(
                  (l) => DropdownMenuItem<ValueSetConcept>(
                    value: l,
                    child: Tooltip(
                      message: l.definition,
                      child: Text('${l.code} - ${l.display}'),
                    ),
                  ),
                )
                .toList(),
            onChanged: (l) {},
            value: selectedValue,
          ),
        ),
      );
}
