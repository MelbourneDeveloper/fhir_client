import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
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
        fieldDefinitionsByResourceType[resource.runtimeType]!
            .nonPrimitiveFields();
    final primitiveFields =
        fieldDefinitionsByResourceType[resource.runtimeType]!.primitiveFields();

    return ListView.builder(
      itemCount: nonPrimitiveFields.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Tile(
            headerTooltip: 'Basic Details',
            headerText: 'Details',
            body: Wrap(
              children: primitiveFields.map(_field).toList(),
            ),
          );
        } else {
          final nonPrimitiveField = nonPrimitiveFields[index - 1];
          final headerTooltip =
              nonPrimitiveField.description ?? 'No information';
          final headerText =
              nonPrimitiveField.display ?? nonPrimitiveField.name;
          return Tile(
            headerTooltip: headerTooltip,
            headerText: headerText,
            body: const Text(''),
          );
        }
      },
    );
  }

  Widget _field<T>(FieldDefinition<T> fd) {
    final value = fd.getValue(resource.json);
    final text = value.toString();
    return SizedBox(
      width: 350,
      height: 80,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 300,
              child: Tooltip(
                message: fd.description,
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(fd.display ?? fd.name),
                  ),
                  controller: TextEditingController(text: text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
