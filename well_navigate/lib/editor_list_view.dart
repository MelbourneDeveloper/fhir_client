import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/element_panel.dart';
import 'package:well_navigate/main.dart';
import 'package:well_navigate/tile.dart';

class EditorListView extends StatelessWidget {
  const EditorListView({
    required this.nonPrimitiveFields,
    required this.primitiveFields,
    required this.resource,
    super.key,
  });

  final FixedList<FieldDefinition<dynamic>> nonPrimitiveFields;
  final FixedList<FieldDefinition<dynamic>> primitiveFields;
  final JsonObject resource;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: nonPrimitiveFields.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Tile(
              headerTooltip: 'Basic Details',
              headerText: 'Details',
              body: ElementPanel(
                element: resource,
                fields: primitiveFields,
                onElementChanged: (k) {},
              ),
            );
          } else {
            final field = nonPrimitiveFields[index - 1];
            final headerTooltip = field.description ?? 'No information';
            final headerText = field.display ?? field.name;

            return Tile(
              headerTooltip: headerTooltip,
              headerText: headerText,
              body: ElementPanel(
                element: resource,
                onElementChanged: (e) {},
                fields: fieldDefinitionsByElementType[Howdowegetelementname]!,
              ),
            );
          }
        },
      );
}
