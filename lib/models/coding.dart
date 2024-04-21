// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Coding {
  final String? system;
  final String? code;
  final String? display;

  Coding({
    this.system,
    this.code,
    this.display,
  });

  factory Coding.fromJson(Map<String, dynamic> json) {
    return Coding(
      system: json['system'] != null ? json['system'] as String? : null,
      code: json['code'] != null ? json['code'] as String? : null,
      display: json['display'] != null ? json['display'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'code': code,
      'display': display,
    };
  }
}
