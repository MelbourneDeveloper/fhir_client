// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Telecom {
  final String? system;
  final String? value;
  final String? use;

  Telecom({
    this.system,
    this.value,
    this.use,
  });

  factory Telecom.fromJson(Map<String, dynamic> json) {
    return Telecom(
      system: json['system'] != null ? json['system'] as String? : null,
      value: json['value'] != null ? json['value'] as String? : null,
      use: json['use'] != null ? json['use'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'value': value,
      'use': use,
    };
  }
}
