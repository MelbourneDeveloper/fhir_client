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
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
        child: DropdownButtonFormField<ValueSetConcept>(
          decoration: InputDecoration(
            labelText: fieldDefinition.display ?? fieldDefinition.name,
            border: const OutlineInputBorder(),
          ),
          selectedItemBuilder: (context) => fieldDefinition.valueSetValues!
              .cast<ValueSetConcept>()
              .toSortedList((a, b) => a.compareTo(b))
              .map(
                (l) => Tooltip(
                  message: l.definition,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                    ), // Adjust the maxWidth value
                    child: Text(
                      '${l.code} - ${l.display}',
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
              .toList(),
          items: fieldDefinition.valueSetValues!
              .cast<ValueSetConcept>()
              .toSortedList((a, b) => a.compareTo(b))
              .map(
                (l) => DropdownMenuItem<ValueSetConcept>(
                  value: l,
                  child: Tooltip(
                    message: l.definition,
                    child: Text(
                      '${l.code} - ${l.display}',
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
              .toList(),
          //TODO:
          onChanged: (l) {},
          value: selectedValue,
        ),
      );
}
