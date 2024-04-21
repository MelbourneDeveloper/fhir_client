// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/coding.dart';

class Specialty {
  final List<Coding>? coding;

  Specialty({
    this.coding,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
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
