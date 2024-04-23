// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/tag.dart';

class Meta {
  final DateTime? lastUpdated;
  final String? versionId;
  final String? source;
  final List<String>? profile;
  final List<Tag>? tag;

  Meta({
    this.lastUpdated,
    this.versionId,
    this.source,
    this.profile,
    this.tag,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastUpdated: DateTime.tryParse(json['lastUpdated'] as String? ?? ''),
      versionId: json['versionId'] as String?,
      source: json['source'] as String?,
      profile: (json['profile'] as List<dynamic>?)?.cast<String>().toList(),
      tag: (json['tag'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastUpdated': lastUpdated.toString(),
      'versionId': versionId,
      'source': source,
      'profile': profile?.cast<String>().toList(),
      'tag': tag?.map((e) => e.toJson()).toList(),
    };
  }
}
