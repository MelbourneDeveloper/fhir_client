// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/issue.dart';
import 'package:fhir_client/models/text.dart';

/// Root type for errors
class Error {
  final String? resourceType;
  final Text? text;
  final List<Issue>? issue;

  Error({
    this.resourceType,
    this.text,
    this.issue,
  });

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      resourceType:
          json['resourceType'] != null ? json['resourceType'] as String? : null,
      text: json['text'] != null
          ? Text.fromJson(json['text'] as Map<String, dynamic>)
          : null,
      issue: (json['issue'] as List<dynamic>?)
          ?.map((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'text': text?.toJson(),
      'issue': issue?.map((e) => e.toJson()).toList(),
    };
  }
}
