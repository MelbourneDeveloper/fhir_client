import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/resource.dart' as res;
import 'package:flutter/material.dart';
import 'package:well_navigate/element_panel.dart';
import 'package:well_navigate/field_definition_list_extensions.dart';
import 'package:well_navigate/main.dart';
import 'package:well_navigate/tile.dart';

class ResourceEditor extends StatelessWidget {
  const ResourceEditor({
    required this.resource,
    super.key,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: _headingRow(),
          ),
          const SizedBox(height: 16),
          Expanded(child: _listView()),
        ],
      );

  Row _headingRow() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event,
            size: 24,
            color: Colors.blue,
          ),
          Text(
            'Appointment',
            style: TextStyle(fontSize: 24),
          ),
        ],
      );

  ListView _listView() {
    final nonPrimitiveFields =
        fieldDefinitionsByElementType[resource.runtimeType]!
            .nonPrimitiveFields();
    final primitiveFields =
        fieldDefinitionsByElementType[resource.runtimeType]!.primitiveFields();

    return ListView.builder(
      itemCount: nonPrimitiveFields.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Tile(
            headerTooltip: 'Basic Details',
            headerText: 'Details',
            body: ElementPanel(element: resource, fields: primitiveFields),
          );
        } else {
          final field = nonPrimitiveFields[index - 1];
          final headerTooltip = field.description ?? 'No information';
          final headerText = field.display ?? field.name;

          return Tile(
            headerTooltip: headerTooltip,
            headerText: headerText,
            body: switch (field.getValue(resource.json)) {
              (final res.Element e)
                  when fieldDefinitionsByElementType
                      .containsKey(e.runtimeType) =>
                ElementPanel(
                  element: e,
                  fields: fieldDefinitionsByElementType[e.runtimeType]!,
                ),
              _ => const SizedBox.shrink()
            },
          );
        }
      },
    );
  }
}
