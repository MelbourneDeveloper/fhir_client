import 'package:fhir_client/models/resource.dart' as res;
import 'package:fhir_client/models/value_sets/appointment_status.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/app_root.dart';
import 'package:well_navigate/field.dart';

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

  StatefulWidget _editorByType(FieldDefinition<dynamic> fieldDefinition) =>
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.secondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.secondary),
              ),
            ),
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
        _ => TextField(
            decoration: InputDecoration(
              labelText: fieldDefinition.display ?? fieldDefinition.name,
            ),
            controller: TextEditingController(
              text: fieldDefinition.getValue(element.json).toString(),
            ),
          ),
      };
}
