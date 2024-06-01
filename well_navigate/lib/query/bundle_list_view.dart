import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';

class BundleListView extends StatelessWidget {
  const BundleListView({
    required this.entries,
    super.key,
  });

  final FixedList<Entry> entries;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) => switch (entries[index].resource) {
          (final Resource resource) => ExpansionTile(
              title: Text(
                '${resource.resourceType} - ${resource.id}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (resource.json.value<String>('status') != null)
                    //Is this valid for all resource? Probably not
                    Text(
                      'Status: ${resource.json.value<String>('status')}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  Text(
                    'Created: ${resource.meta?.lastUpdated}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: () {
                  // TODO: Implement opening the resource in a new screen
                },
              ),
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      spacing: 32,
                      runSpacing: 16,
                      children:
                          fieldDefinitionsByElementType[resource.resourceType]!
                              .map(
                                (fieldDefinition) => _valueRow(
                                  fieldDefinition,
                                  context,
                                  resource,
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ],
            ),
          _ => const Text('Not a resource'),
        },
      );

  Row _valueRow(
    FieldDefinition<Object> fieldDefinition,
    BuildContext context,
    Resource resource,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '${fieldDefinition.name}:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 250,
            child: Text(
              fieldDefinition.getValue(resource.json).toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      );
}
