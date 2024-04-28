import 'package:fhir_client/models/fixed_list.dart';
import 'package:fhir_client/models/tag.dart';

class Meta {
  Meta({
    this.lastUpdated,
    this.versionId,
    this.source,
    this.profile,
    this.tag,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lastUpdated: DateTime.tryParse(json['lastUpdated'] as String? ?? ''),
        versionId: json['versionId'] as String?,
        source: json['source'] as String?,
        profile:
            (json['profile'] as List<dynamic>?)?.cast<String>().toFixedList(),
        tag: (json['tag'] as List<dynamic>?)
            ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );
  final DateTime? lastUpdated;
  final String? versionId;
  final String? source;
  final FixedList<String>? profile;
  final FixedList<Tag>? tag;

  Map<String, dynamic> toJson() => {
        'lastUpdated': lastUpdated.toString(),
        'versionId': versionId.toString(),
        'source': source,
        'profile': profile?.cast<String>().toList(),
        'tag': tag?.map((e) => e.toJson()).toList(),
      };
}
