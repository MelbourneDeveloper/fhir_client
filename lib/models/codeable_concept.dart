import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/coding.dart';
import 'package:fhir_client/models/coding_list.dart';
import 'package:jayse/jayse.dart';

/// A concept that may be defined by a formal reference to a terminology or
/// ontology or may be provided by text.
class CodeableConcept implements CodingList {
  CodeableConcept({
    FixedList<Coding>? coding,
    String? text,
  }) : this.fromJson(
          JsonObject({
            if (coding != null)
              codingField.name: JsonArray(coding.map((e) => e.json).toList()),
            if (text != null) textField.name: JsonString(text),
          }),
        );

  /// Creates a new [CodeableConcept] instance from a [JsonObject].
  CodeableConcept.fromJson(this._json);

  final JsonObject _json;

  /// The underlying JSON object for this instance.
  JsonObject get json => _json;

  /// A reference to a code defined by a terminology system.
  @override
  FixedList<Coding>? get coding => codingField.getValue(_json);

  /// A human language representation of the concept as seen/selected/uttered by the user
  /// who entered the data and/or which represents the intended meaning of the user.
  @override
  String? get text => textField.getValue(_json);

  /// Field definition for [coding]
  static const codingField = FieldDefinition(
    name: 'coding',
    getValue: _getCoding,
  );

  /// Field definition for [text]
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
  );

  /// All field definitions for [CodeableConcept]
  static const fieldDefinitions = [
    codingField,
    textField,
  ];

  static FixedList<Coding>? _getCoding(JsonObject jo) => switch (jo['coding']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Coding.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static String? _getText(JsonObject jo) =>
      jo.getValue(textField.name).stringValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CodeableConcept &&
          other.coding == coding &&
          other.text == text);

  @override
  int get hashCode => Object.hash(coding, text);

  /// Makes a copy of this [CodeableConcept] and allows for
  /// non-destructive mutation.
  CodeableConcept copyWith({
    FixedList<Coding>? coding,
    String? text,
  }) =>
      CodeableConcept(
        coding: coding ?? this.coding,
        text: text ?? this.text,
      );
}
