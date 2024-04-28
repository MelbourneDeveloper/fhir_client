import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/coding.dart';

class Type {
  Type({
    this.text,
    this.coding,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        text: json['text'] != null ? json['text'] as String? : null,
        coding: (json['coding'] as List<dynamic>?)
            ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final String? text;
  final FixedList<Coding>? coding;

  Map<String, dynamic> toJson() => {
        'text': text,
        'coding': coding?.map((e) => e.toJson()).toList(),
      };
}
