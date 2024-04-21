// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/search.dart';

class Entry {
  final String? fullUrl;
  final Resource? resource;
  final Search? search;

  Entry({
    this.fullUrl,
    this.resource,
    this.search,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      fullUrl: json['fullUrl'] != null ? json['fullUrl'] as String? : null,
      resource: json['resource'] != null
          ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
      search: json['search'] != null
          ? Search.fromJson(json['search'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullUrl': fullUrl,
      'resource': resource?.toJson(),
      'search': search?.toJson(),
    };
  }
}
