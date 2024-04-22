// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Tag {
  final String? system;
  final String? code;

  Tag({
    this.system,
    this.code,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      system: json['system'] != null ? json['system'] as String? : null,
      code: json['code'] != null ? json['code'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'code': code,
    };
  }
}
