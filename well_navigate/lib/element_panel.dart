import 'package:fhir_client/models/resource.dart' as res;
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';

class ElementPanel extends StatelessWidget {
  const ElementPanel({
    required this.fields,
    required this.element,
    super.key,
  });

  // ignore: strict_raw_type
  final List<FieldDefinition> fields;
  final res.Element element;

  @override
  Widget build(BuildContext context) => Wrap(
        children: fields.map(_field).toList(),
      );

  Widget _field<T>(FieldDefinition<T> fd) {
    final value = fd.getValue(element.json);
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
                message: fd.description ?? fd.name,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: fd.display ?? fd.name,
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
