// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Coding {
  final Uri? system;
  final String? code;
  final String? display;

  Coding({
    this.system,
    this.code,
    this.display,
  });

  factory Coding.fromJson(Map<String, dynamic> json) {
    return Coding(
      system: Uri.tryParse(json['system'] as String? ?? ''),
      code: json['code'] != null ? json['code'] as String? : null,
      display: json['display'] != null ? json['display'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system.toString(),
      'code': code,
      'display': display,
    };
  }
}
