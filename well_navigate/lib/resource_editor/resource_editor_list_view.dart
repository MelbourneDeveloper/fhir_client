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
import 'package:well_navigate/main.dart';
import 'package:well_navigate/resource_editor/element_panel.dart';
import 'package:well_navigate/resource_editor/tile.dart';

class ResourceEditorListView extends StatelessWidget {
  const ResourceEditorListView({
    required this.nonPrimitiveFields,
    required this.primitiveFields,
    required this.resourceRoot,
    required this.onFieldChanged,
    super.key,
  });

  final FixedList<FieldDefinition<dynamic>> nonPrimitiveFields;
  final FixedList<FieldDefinition<dynamic>> primitiveFields;
  final JsonObject resourceRoot;

  /// Fires when the field for the resource changes. It might an individual
  /// primitive value like a string or number or an entire element
  final void Function(String field, JsonValue jsonValue) onFieldChanged;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: nonPrimitiveFields.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Tile(
              headerTooltip: 'Basic Details',
              headerText: 'Details',
              body: ElementPanel(
                panelElement: resourceRoot,
                fields: primitiveFields,
                onFieldChanged: onFieldChanged,
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
                : switch (resourceRoot[field.name]) {
                    (final JsonObject panelElement) => Tile(
                        headerTooltip: headerTooltip,
                        headerText: headerText,
                        body: ElementPanel(
                          panelElement: panelElement,
                          //One of the editors on the panel fired a change
                          onFieldChanged: (f, e) => onFieldChanged(
                            field.name,
                            panelElement.withUpdate(f, e),
                          ),
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
