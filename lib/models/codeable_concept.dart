import 'package:fhir_client/models/coding.dart';

class CodeableConcept {
  CodeableConcept({
    this.coding,
    this.text,
  });

  factory CodeableConcept.fromJson(Map<String, dynamic> json) =>
      CodeableConcept(
        coding: (json['coding'] as List<dynamic>?)
            ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
            .toList(),
        text: json['text'] != null ? json['text'] as String? : null,
      );

  final List<Coding>? coding;
  final String? text;

  Map<String, dynamic> toJson() => {
        'coding': coding?.map((e) => e.toJson()).toList(),
        'text': text,
      };
}
