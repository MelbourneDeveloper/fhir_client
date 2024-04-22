// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/extension.dart';

class Telecom {
  final List<Extension>? extension;
  final String? system;
  final String? value;
  final String? use;

  Telecom({
    this.extension,
    this.system,
    this.value,
    this.use,
  });

  factory Telecom.fromJson(Map<String, dynamic> json) {
    return Telecom(
      extension: (json['extension'] as List<dynamic>?)
          ?.map((e) => Extension.fromJson(e as Map<String, dynamic>))
          .toList(),
      system: json['system'] != null ? json['system'] as String? : null,
      value: json['value'] != null ? json['value'] as String? : null,
      use: json['use'] != null ? json['use'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'extension': extension?.map((e) => e.toJson()).toList(),
      'system': system,
      'value': value,
      'use': use,
    };
  }
}
