// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/coding.dart';

class Type {
  final String? text;
  final List<Coding>? coding;

  Type({
    this.text,
    this.coding,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      text: json['text'] != null ? json['text'] as String? : null,
      coding: (json['coding'] as List<dynamic>?)
          ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'coding': coding?.map((e) => e.toJson()).toList(),
    };
  }
}
