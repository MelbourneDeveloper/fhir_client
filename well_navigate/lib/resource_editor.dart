import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/editor_list_view.dart';
import 'package:well_navigate/field_definition_list_extensions.dart';
import 'package:well_navigate/main.dart';

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
                  EditorListView(
                    resource: resource,
                    nonPrimitiveFields:
                        fieldDefinitionsByElementType[resource.runtimeType]!
                            .nonPrimitiveFields(),
                    primitiveFields:
                        fieldDefinitionsByElementType[resource.runtimeType]!
                            .primitiveFields(),
                  ),
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
}
