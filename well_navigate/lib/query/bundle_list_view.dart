import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';

class BundleListView extends StatelessWidget {
  const BundleListView({
    required this.bundle,
    super.key,
  });

  final Bundle bundle;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: bundle.entry!.length,
        itemBuilder: (context, index) => Text(
          bundle.entry![index].resource?.resourceType ?? '',
        ),
      );
}
