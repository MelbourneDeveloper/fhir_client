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
        itemBuilder: (context, index) => Text(
          entries[index].resource?.resourceType ?? '',
        ),
      );
}
