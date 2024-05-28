import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/editor_list_view.dart';
import 'package:well_navigate/field_definition_list_extensions.dart';
import 'package:well_navigate/json_editor.dart';
import 'package:well_navigate/main.dart';

class ResourceEditor extends StatefulWidget {
  const ResourceEditor({
    required this.resource,
    required this.resourceTypeName,
    super.key,
  });

  final JsonObject resource;
  final String resourceTypeName;

  @override
  State<ResourceEditor> createState() => _ResourceEditorState();
}

class _ResourceEditorState extends State<ResourceEditor> {
  JsonObject? _resource;
  JsonObject get resource => _resource ?? widget.resource;

  @override
  void initState() {
    super.initState();
    _resource = widget.resource;
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
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
                        fieldDefinitionsByElementType[widget.resourceTypeName]!
                            .nonPrimitiveFields(),
                    primitiveFields:
                        fieldDefinitionsByElementType[widget.resourceTypeName]!
                            .primitiveFields(),
                  ),
                  JsonEditor(
                    initialJson: jsonValueEncode(resource),
                    onChanged: (json) => setState(
                      //TODO: error handling
                      () => _resource = jsonValueDecode(json) as JsonObject,
                    ),
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
            iconsByResourceType[resource.runtimeType] ?? Icons.medical_services,
            size: 36,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 12),
          Text(
            resource.runtimeType.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      );
}
