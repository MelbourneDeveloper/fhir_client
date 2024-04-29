// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/json_object.dart';
import 'package:fhir_client/models/reference.dart';

const _authorReferenceField = 'authorReference';
const _authorStringField = 'authorString';
const _timeField = 'time';
const _textField = 'text';

/// A text note which also contains information about who made the statement and when.
class Annotation extends JsonObject {
  /// Constructs a new [Annotation].
  Annotation({
    Definable<Reference> authorReference = const Undefined(),
    Definable<String> authorString = const Undefined(),
    Definable<DateTime> time = const Undefined(),
    Definable<String> text = const Undefined(),
  }) : super({
          if (authorReference is Defined<Reference>)
            _authorReferenceField: authorReference.value,
          if (authorString is Defined<String>)
            _authorStringField: authorString.value,
          if (time is Defined<DateTime>)
            _timeField: time.value?.toIso8601String(),
          if (text is Defined<String>) _textField: text.value,
        });

  /// Constructs a new [Annotation]. This constructor treats nulls as undefined.
  Annotation.primitives({
    Reference? authorReference,
    String? authorString,
    DateTime? time,
    String? text,
  }) : super({
          if (authorReference != null)
            'authorReference': authorReference.toJson(),
          if (authorString != null) 'authorString': authorString,
          if (time != null) 'time': time.toIso8601String(),
          if (text != null) 'text': text,
        });

  /// Creates an [Annotation] instance from the provided JSON object.
  Annotation.fromJson(super.json);

  /// The individual responsible for making the annotation.
  ///
  /// Type: ReferenceType
  /// Path: Annotation.authorReference
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get authorReference => getValueFromObjectArray(
        _authorReferenceField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The individual responsible for making the annotation.
  ///
  /// Type: StringType
  /// Path: Annotation.authorString
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get authorString => getValue(_authorStringField);

  /// Indicates when this particular annotation was made.
  ///
  /// Type: DateTimeType
  /// Path: Annotation.time
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get time => getValueFromString(
        _timeField,
        tryParse: (t) => DateTime.tryParse(t ?? ''),
      );

  /// The text of the annotation in markdown format.
  ///
  /// Type: MarkdownType
  /// Path: Annotation.text
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<String> get text => getValue(_textField);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Annotation &&
          other.authorReference == authorReference &&
          other.authorString == authorString &&
          other.time == time &&
          other.text == text);

  @override
  int get hashCode => Object.hash(authorReference, authorString, time, text);

  /// Creates a copy of the [Annotation] instance and allows
  /// for non-destructive mutation.
  Annotation copyWith({
    Definable<Reference>? authorReference,
    Definable<String>? authorString,
    Definable<DateTime>? time,
    Definable<String>? text,
  }) =>
      Annotation(
        authorReference: authorReference ?? this.authorReference,
        authorString: authorString ?? this.authorString,
        time: time ?? this.time,
        text: text ?? this.text,
      );
}
