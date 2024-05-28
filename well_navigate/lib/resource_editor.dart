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
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: _headingRow(context),
            ),
            const SizedBox(height: 16),
            const TabBar(
              dividerColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  text: 'Editor',
                  icon: Icon(Icons.medical_services),
                ),
                Tab(
                  text: 'JSON',
                  icon: Icon(Icons.code),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  _listView(),
                  TextField(
                    controller: TextEditingController(text: 'JSON'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Row _headingRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event,
            size: 36,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 12),
          Text(
            'Appointment',
            style: Theme.of(context).textTheme.headlineLarge,
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
