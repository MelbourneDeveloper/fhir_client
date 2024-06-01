import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/resource.dart';
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
                  // Text(
                  //   'Status: ${resource.status}',
                  //   style: Theme.of(context).textTheme.bodySmall,
                  // ),
                  Text(
                    'Last Updated: ${resource.meta?.lastUpdated}',
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
              children: fieldDefinitionsByElementType[resource.resourceType]!
                  .map(
                    (fieldDefinition) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Text(
                            '${fieldDefinition.name}:',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            fieldDefinition.getValue(resource.json).toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          _ => const Text('Not a resource'),
        },
      );
}
