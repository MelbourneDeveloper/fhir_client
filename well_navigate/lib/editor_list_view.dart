import 'package:fhir_client/models/backbone_element.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/service_category.dart';
import 'package:fhir_client/models/value_sets/service_type.dart';
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

            //TODO: remove this stuff
            return [
              (FieldDefinition<FixedList<Resource>>),
              (FieldDefinition<FixedList<Identifier>>),
              (FieldDefinition<FixedList<ServiceCategory>>),
              (FieldDefinition<FixedList<ServiceType>>),
              (FieldDefinition<FixedList<CodeableConcept>>),
              (FieldDefinition<FixedList<Reference>>),
              (FieldDefinition<FixedList<BackboneElement>>),
              (FieldDefinition<FixedList<Period>>),
            ].contains(field.runtimeType)
                ? const SizedBox.shrink()
                : switch (resource[field.name]) {
                    (final JsonObject jo) => Tile(
                        headerTooltip: headerTooltip,
                        headerText: headerText,
                        body: ElementPanel(
                          element: jo,
                          onElementChanged: (e) {},
                          fields: fieldDefinitionsByElementType[
                              field.runtimeType.toString()]!,
                        ),
                      ),
                    _ => Text('${field.name}: not an object')
                  };
          }
        },
      );
}
