import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/coding.dart';
import 'package:fhir_client/models/coding_list.dart';
import 'package:jayse/jayse.dart';

/// A reference to a resource or a concept.
class CodeableReference implements CodingList {
  /// Creates a new [CodeableReference] instance.
  CodeableReference({
    FixedList<Coding>? coding,
    String? text,
  }) : this.fromJson(
          JsonObject({
            if (coding != null)
              codingField.name: JsonArray.unmodifiable(
                coding.map((e) => e.json),
              ),
            if (text != null) textField.name: JsonString(text),
          }),
        );

  /// Creates an [CodeableReference] instance from the provided JSON object.
  CodeableReference.fromJson(this._json);

  final JsonObject _json;

  /// A reference to a code defined by a terminology system.
  @override
  FixedList<Coding>? get coding => codingField.getValue(_json);

  /// Plain text narrative that identifies the resource in addition to the
  /// resource reference.
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

  /// All field definitions for [CodeableReference]
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

  /// Converts this [CodeableReference] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CodeableReference &&
          other.coding == coding &&
          other.text == text);

  @override
  int get hashCode => coding.hashCode ^ text.hashCode;

  /// Creates a copy of this [CodeableReference] but with the given fields
  CodeableReference copyWith({
    FixedList<Coding>? coding,
    String? text,
  }) =>
      CodeableReference(
        coding: coding ?? this.coding,
        text: text ?? this.text,
      );
}
