import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';

class Field<T> extends StatelessWidget {
  const Field({
    required this.editor,
    required this.fieldDefinition,
    super.key,
  });

  final Widget editor;
  final FieldDefinition<T> fieldDefinition;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 350,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: standardHorizontalPaddingValue,
          ),
          child: SizedBox(
            width: 300,
            height: double.infinity,
            child: Tooltip(
              message: fieldDefinition.description ?? fieldDefinition.name,
              child: editor,
            ),
          ),
        ),
      );
}
