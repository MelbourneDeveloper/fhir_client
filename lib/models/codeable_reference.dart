import 'package:fhir_client/models/coding.dart';
import 'package:fhir_client/models/coding_list.dart';
import 'package:fhir_client/models/fixed_list.dart';

class CodeableReference implements CodingList {
  CodeableReference({
    this.coding,
    this.text,
  });

  factory CodeableReference.fromJson(Map<String, dynamic> json) =>
      CodeableReference(
        coding: (json['coding'] as List<dynamic>?)
            ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        text: json['text'] != null ? json['text'] as String? : null,
      );
      
  @override
  final FixedList<Coding>? coding;

  @override
  final String? text;

  Map<String, dynamic> toJson() => {
        'coding': coding?.map((e) => e.toJson()).toList(),
        'text': text,
      };
}
