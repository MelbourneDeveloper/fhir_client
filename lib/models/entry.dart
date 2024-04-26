import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/search.dart';

class Entry {
  Entry({
    this.fullUrl,
    this.resource,
    this.search,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        fullUrl: Uri.tryParse(json['fullUrl'] as String? ?? ''),
        resource: json['resource'] != null
            ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
            : null,
        search: json['search'] != null
            ? Search.fromJson(json['search'] as Map<String, dynamic>)
            : null,
      );
  final Uri? fullUrl;
  final Resource? resource;
  final Search? search;

  Map<String, dynamic> toJson() => {
        'fullUrl': fullUrl.toString(),
        'resource': resource,
        'search': search?.toJson(),
      };
}
