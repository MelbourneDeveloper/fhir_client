import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:flutter/material.dart';

class BundleListView extends StatelessWidget {
  const BundleListView({
    required this.entries,
    super.key,
  });

  final FixedList<Entry> entries;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            entries[index].resource?.resourceType ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            'Id: ${entries[index].resource?.id ?? ''}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
}
