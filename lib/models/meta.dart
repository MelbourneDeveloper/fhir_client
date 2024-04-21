// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Meta {
  final String? lastUpdated;

  Meta({
    this.lastUpdated,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastUpdated:
          json['lastUpdated'] != null ? json['lastUpdated'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastUpdated': lastUpdated,
    };
  }
}
