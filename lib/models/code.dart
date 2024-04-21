// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/coding.dart';

class Code {
  final List<Coding>? coding;

  Code({
    this.coding,
  });

  factory Code.fromJson(Map<String, dynamic> json) {
    return Code(
      coding: (json['coding'] as List<dynamic>?)
          ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coding': coding?.map((e) => e.toJson()).toList(),
    };
  }
}
