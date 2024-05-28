import 'package:fhir_client/models/resource.dart' as res;
import 'package:fhir_client/models/value_sets/appointment_status.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/field.dart';
import 'package:well_navigate/string_editor.dart';

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

  Widget _field<T>(FieldDefinition<T> fieldDefinition) => Field(
        fieldDefinition: fieldDefinition,
        editor: _editorByType(fieldDefinition),
      );

  Widget _editorByType(FieldDefinition<dynamic> fieldDefinition) =>
      switch (fieldDefinition) {
        FieldDefinition<String>() => TextField(
            decoration: InputDecoration(
              labelText: fieldDefinition.display ?? fieldDefinition.name,
            ),
            controller: TextEditingController(
              text: fieldDefinition.getValue(element.json).toString(),
            ),
          ),
        FieldDefinition<AppointmentStatus>() => InputDecorator(
            decoration: const InputDecoration(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AppointmentStatus>(
                items: AppointmentStatus.values
                    .map(
                      (l) => DropdownMenuItem<AppointmentStatus>(
                        value: l,
                        child: Text(l.display),
                      ),
                    )
                    .toList(),
                onChanged: (l) {},
                value: AppointmentStatus.proposed,
              ),
            ),
          ),
        _ => StringEditor(
            fieldDefinition: fieldDefinition,
            element: element,
          ),
      };
}
