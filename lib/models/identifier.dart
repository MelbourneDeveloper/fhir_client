// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/type.dart';

class Identifier {
  final Type? type;
  final String? system;
  final String? value;

  Identifier({
    this.type,
    this.system,
    this.value,
  });

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      type: json['type'] != null
          ? Type.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      system: json['system'] != null ? json['system'] as String? : null,
      value: json['value'] != null ? json['value'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type?.toJson(),
      'system': system,
      'value': value,
    };
  }
}
