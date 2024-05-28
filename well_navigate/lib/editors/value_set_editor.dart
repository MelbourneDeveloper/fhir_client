import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:flutter/material.dart';

class ValueSetEditor<T extends ValueSetConcept<T>> extends StatelessWidget {
  const ValueSetEditor({
    required this.items,
    super.key,
    this.selectedValue,
  });

  final FixedList<T> items;
  final T? selectedValue;

  @override
  Widget build(BuildContext context) => InputDecorator(
        decoration: const InputDecoration(),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            items: items
                .map(
                  (l) => DropdownMenuItem<T>(
                    value: l,
                    child: Text(l.display),
                  ),
                )
                .toList(),
            onChanged: (l) {},
            value: selectedValue,
          ),
        ),
      );
}
