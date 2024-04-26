// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Name {
  final String? family;
  //TODO: enum
  final String? use;
  final List<String>? given;
  final List<String>? prefix;

  Name({
    this.family,
    this.use,
    this.given,
    this.prefix,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      family: json['family'] != null ? json['family'] as String? : null,
      use: json['use'] as String?,
      given: (json['given'] as List<dynamic>?)?.cast<String>().toList(),
      prefix: (json['prefix'] as List<dynamic>?)?.cast<String>().toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family': family,
      'use': use,
      'given': given?.cast<dynamic>().toList(),
      'prefix': prefix?.cast<dynamic>().toList(),
    };
  }
}
