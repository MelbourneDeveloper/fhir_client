import 'package:fhir_client/models/coding.dart';

class CodeableReference {
  CodeableReference({
    this.coding,
    this.text,
  });

  factory CodeableReference.fromJson(Map<String, dynamic> json) =>
      CodeableReference(
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
