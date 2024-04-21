// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/link.dart';
import 'package:fhir_client/models/meta.dart';

/// Root type for searches
class Result {
  final String? resourceType;
  final String? id;
  final Meta? meta;
  final String? type;
  final int? total;
  final List<Link>? link;
  final List<Entry>? entry;

  Result({
    this.resourceType,
    this.id,
    this.meta,
    this.type,
    this.total,
    this.link,
    this.entry,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resourceType:
          json['resourceType'] != null ? json['resourceType'] as String? : null,
      id: json['id'] != null ? json['id'] as String? : null,
      meta: json['meta'] != null
          ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
      type: json['type'] != null ? json['type'] as String? : null,
      total: json['total'] != null ? json['total'] as int? : null,
      link: (json['link'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      entry: (json['entry'] as List<dynamic>?)
          ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'id': id,
      'meta': meta?.toJson(),
      'type': type,
      'total': total,
      'link': link?.map((e) => e.toJson()).toList(),
      'entry': entry?.map((e) => e.toJson()).toList(),
    };
  }
}
