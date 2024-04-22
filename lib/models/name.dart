// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Name {
  final String? family;
  final List<String>? given;
  final List<String>? prefix;

  Name({
    this.family,
    this.given,
    this.prefix,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      family: json['family'] != null ? json['family'] as String? : null,
      given: (json['given'] as List<dynamic>?)?.cast<String>().toList(),
      prefix: (json['prefix'] as List<dynamic>?)?.cast<String>().toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family': family,
      'given': given?.cast<dynamic>().toList(),
      'prefix': prefix?.cast<dynamic>().toList(),
    };
  }
}
