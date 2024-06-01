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
              children: fieldDefinitionsByElementType[resource.resourceType]!
                  .map((fieldDefinition) {
                final fieldName = fieldDefinition.name;
                final fieldValue = fieldDefinition.getValue(resource.json);

                return ListTile(
                  title: Text(
                    fieldName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    fieldValue.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }).toList(),
            ),
          _ => const Text('Not a resource')
        },
      );
}
