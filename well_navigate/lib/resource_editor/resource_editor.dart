import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/resource_editor/field_definition_list_extensions.dart';
import 'package:well_navigate/resource_editor/json_editor.dart';
import 'package:well_navigate/resource_editor/resource_editor_list_view.dart';

class ResourceEditor extends StatefulWidget {
  const ResourceEditor({
    required this.resourceRoot,
    required this.resourceTypeName,
    super.key,
  });

  final JsonObject resourceRoot;
  final String resourceTypeName;

  @override
  State<ResourceEditor> createState() => _ResourceEditorState();
}

class _ResourceEditorState extends State<ResourceEditor> {
  JsonObject? _resource;
  JsonObject get resource => _resource ?? widget.resourceRoot;

  @override
  void initState() {
    super.initState();
    _resource = widget.resourceRoot;
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              dividerColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  text: 'Editor',
                  icon: Icon(Icons.medical_services),
                  iconMargin: EdgeInsets.only(bottom: 4),
                ),
                Tab(
                  text: 'JSON',
                  icon: Icon(Icons.code),
                  iconMargin: EdgeInsets.only(bottom: 4),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  ResourceEditorListView(
                    resourceRoot: resource,
                    nonPrimitiveFields:
                        fieldDefinitionsByElementType[widget.resourceTypeName]!
                            .nonPrimitiveFields(),
                    primitiveFields:
                        fieldDefinitionsByElementType[widget.resourceTypeName]!
                            .primitiveFields(),
                    onFieldChanged: (f, e) =>
                        setState(() => _resource = _resource?.withUpdate(f, e)),
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
}
