import 'package:fhir_client/models/coding.dart';
import 'package:fhir_client/models/coding_list.dart';

class CodeableConcept implements CodingList {
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

  @override
  final List<Coding>? coding;

  @override
  final String? text;

  Map<String, dynamic> toJson() => {
        'coding': coding?.map((e) => e.toJson()).toList(),
        'text': text,
      };
}
