// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Meta {
  final String? lastUpdated;
  final String? versionId;
  final String? source;

  Meta({
    this.lastUpdated,
    this.versionId,
    this.source,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastUpdated: json['lastUpdated'] as String?,
      versionId: json['versionId'] as String?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastUpdated': lastUpdated,
      'versionId': versionId,
      'source' : source,
    };
  }
}
