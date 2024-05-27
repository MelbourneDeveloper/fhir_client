import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';

class ComponentPanel extends StatelessWidget {
  const ComponentPanel({
    required this.fields,
    required this.component,
    super.key,
  });

  final FixedList<FieldDefinition<dynamic>> fields;
  final Resource component;

  @override
  Widget build(BuildContext context) => Wrap(
        children: fields.map(_field).toList(),
      );

  Widget _field<T>(FieldDefinition<T> fd) {
    final value = fd.getValue(component.json);
    final text = value.toString();
    return SizedBox(
      width: 350,
      height: 80,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 300,
              child: Tooltip(
                message: fd.description,
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(fd.display ?? fd.name),
                  ),
                  controller: TextEditingController(text: text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
