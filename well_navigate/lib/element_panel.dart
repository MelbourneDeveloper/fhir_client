import 'package:fhir_client/models/resource.dart' as res;
import 'package:fhir_client/models/value_sets/language.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
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

  StatefulWidget _editorByType(FieldDefinition<dynamic> fieldDefinition) {
    if (fieldDefinition is FieldDefinition<String>) {
      return TextField(
        decoration: InputDecoration(
          labelText: fieldDefinition.display ?? fieldDefinition.name,
        ),
        controller: TextEditingController(
          text: fieldDefinition.getValue(element.json).toString(),
        ),
      );
    } else if (fieldDefinition is FieldDefinition<Language>) {
      return DropdownButton<Language>(
        items: Language.values
            .map(
              (l) => DropdownMenuItem<Language>(child: Text(l.display)),
            )
            .toList(),
        onChanged: (l) {},
      );
    } else {
      throw UnimplementedError();
    }
  }
}
