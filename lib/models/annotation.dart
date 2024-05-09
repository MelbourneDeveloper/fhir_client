// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:jayse/jayse.dart';

/// A text note which also contains information about who made the statement and when.
class Annotation {
  /// Constructs a new [Annotation].
  Annotation({
    Reference? authorReference,
    String? authorString,
    DateTime? time,
    String? text,
  }) : this.fromJson(
          JsonObject({
            if (authorReference != null)
              authorReferenceField.name: authorReference.json,
            if (authorString != null)
              authorStringField.name: JsonString(authorString),
            if (time != null) timeField.name: JsonString(time.toString()),
            if (text != null) textField.name: JsonString(text),
          }),
        );

  /// Creates an [Annotation] instance from the provided JSON object.
  Annotation.fromJson(this._json);

  final JsonObject _json;

  /// The individual responsible for making the annotation.
  Reference? get authorReference => authorReferenceField.getValue(_json);

  /// The individual responsible for making the annotation.
  String? get authorString => authorStringField.getValue(_json);

  /// Indicates when this particular annotation was made.
  DateTime? get time => timeField.getValue(_json);

  /// The text of the annotation in markdown format.
  String? get text => textField.getValue(_json);

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

  static Reference? _getAuthorReference(JsonObject jo) =>
      switch (jo['authorReference']) {
        (final JsonObject jo) => Reference.fromJson(jo),
        _ => null,
      };

  static String? _getauthorString(JsonObject jo) =>
      jo.getValue(authorStringField.name).stringValue;

  static DateTime? _getTime(JsonObject jo) =>
      DateTime.tryParse(jo.getValue(timeField.name).stringValue ?? '');

  static String? _getText(JsonObject jo) =>
      jo.getValue(textField.name).stringValue;

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
    Reference? authorReference,
    String? authorString,
    DateTime? time,
    String? text,
  }) =>
      Annotation(
        authorReference: authorReference ?? this.authorReference,
        authorString: authorString ?? this.authorString,
        time: time ?? this.time,
        text: text ?? this.text,
      );
}
