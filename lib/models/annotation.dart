// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/string_backed_value.dart';
import 'package:fhir_client/models/reference.dart';

/// A  text note which also  contains information about who made the statement and when.
class Annotation {
  /// Creates an [Annotation] instance
  Annotation({
    required this.time,
    this.authorReference,
    this.authorString,
    this.text,
  });

  /// Creates an [Annotation] instance from JSON data
  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        authorReference: json['authorReference'] != null
            ? Reference.fromJson(
                json['authorReference'] as Map<String, dynamic>,
              )
            : null,
        authorString: json['authorString'] as String?,
        time: StringBackedValue.fromJson(json, 'time'),
        text: json['text'] as String?,
      );

  /// The individual responsible for making the annotation.
  final Reference? authorReference;

  /// The individual responsible for making the annotation.
  final String? authorString;

  /// Indicates when this particular annotation was made.
  final StringBackedValue<DateTime> time;

  /// The text of the annotation in markdown format.
  final String? text;

  /// Converts an [Annotation] instance to JSON data
  Map<String, dynamic> toJson() => {
        'authorReference': authorReference?.toJson(),
        'authorString': authorString,
        'time': time.text,
        'text': text,
      };

  /// Creates a copy of the [Annotation] instance and allows
  /// for non-destructive mutation
  Annotation copyWith({
    Reference? authorReference,
    String? authorString,
    StringBackedValue<DateTime>? time,
    String? text,
  }) =>
      Annotation(
        authorReference: authorReference ?? this.authorReference,
        authorString: authorString ?? this.authorString,
        time: time ?? this.time,
        text: text ?? this.text,
      );
}
