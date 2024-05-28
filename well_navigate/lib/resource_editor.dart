import 'package:fhir_client/models/resource.dart';
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
    super.key,
  });

  final Resource resource;

  @override
  State<ResourceEditor> createState() => _ResourceEditorState();
}

class _ResourceEditorState extends State<ResourceEditor> {
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
                    resource: widget.resource,
                    nonPrimitiveFields: fieldDefinitionsByElementType[
                            widget.resource.runtimeType]!
                        .nonPrimitiveFields(),
                    primitiveFields: fieldDefinitionsByElementType[
                            widget.resource.runtimeType]!
                        .primitiveFields(),
                  ),
                  JsonEditor(
                    initialJson: jsonValueEncode(widget.resource.json),
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
            iconsByResourceType[widget.resource.runtimeType] ??
                Icons.medical_services,
            size: 36,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 12),
          Text(
            widget.resource.runtimeType.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      );
}
