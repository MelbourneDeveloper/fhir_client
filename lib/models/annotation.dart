// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/json_object.dart';
import 'package:fhir_client/models/reference.dart';

/// A text note which also contains information about who made the statement and when.
class Annotation extends JsonObject {
  /// Constructs a new [Annotation].
  Annotation({
    Definable<Reference> authorReference = const Undefined(),
    Definable<String> authorString = const Undefined(),
    Definable<DateTime> time = const Undefined(),
    Definable<String> text = const Undefined(),
  }) : super(
          Map<String, dynamic>.fromEntries([
            if (authorReference is Defined)
              authorReference.toMapEntry(authorReferenceField.name),
            if (authorString is Defined)
              authorString.toMapEntry(authorStringField.name),
            if (time is Defined) time.toMapEntry(timeField.name),
            if (text is Defined) text.toMapEntry(textField.name),
          ]),
        );

  /// Creates an [Annotation] instance from the provided JSON object.
  Annotation.fromJson(super.json);

  /// The individual responsible for making the annotation.
  Definable<Reference> get authorReference =>
      authorReferenceField.getValue(this);

  /// The individual responsible for making the annotation.
  Definable<String> get authorString => authorStringField.getValue(this);

  /// Indicates when this particular annotation was made.
  Definable<DateTime> get time => timeField.getValue(this);

  /// The text of the annotation in markdown format.
  Definable<String> get text => textField.getValue(this);

  /// Field definition for [authorReference]
  static const authorReferenceField = FieldDefinition(
    name: 'authorReference',
    getValue: _getAuthorReference,
  );

  /// Field definition for [authorString]
  static const authorStringField = FieldDefinition(
    name: 'authorString',
    getValue: _getauthorString,
  );

  /// Field definition for [time]
  static const timeField = FieldDefinition(
    name: 'time',
    getValue: _getTime,
  );

  /// Field definition for [text]
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
  );

  /// All field definitions for [Annotation]
  static const fieldDefinitions = [
    authorReferenceField,
    authorStringField,
    timeField,
    textField,
  ];

  //TODO: this looks wrong. Add a test that includes a reference on
  //an annotation
  static Definable<Reference> _getAuthorReference(JsonObject jo) =>
      jo.getValueFromObjectArray(
        authorReferenceField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<String> _getauthorString(JsonObject jo) =>
      jo.getValue(authorStringField.name);

  static Definable<DateTime> _getTime(JsonObject jo) => jo.getValueFromString(
        timeField.name,
        tryParse: (t) => DateTime.tryParse(t ?? ''),
      );

  static Definable<String> _getText(JsonObject jo) =>
      jo.getValue(textField.name);

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
