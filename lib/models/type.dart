import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/coding.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A place holder that means any kind of data type
class Type {

  /// Constructs a new [Type] with an optional text and coding.
  Type({
    String? text,
    FixedList<Coding>? coding,
  }) : this.fromJson(
          JsonObject({
            if (text != null) textField.name: JsonString(text),
            if (coding != null)
              codingField.name: JsonArray.unmodifiable(
                coding.map((e) => e.json),
              ),
          }),
        );

  /// Constructs a new [Type] instance from the provided JSON object.
  Type.fromJson(this._json);

  final JsonObject _json;

  /// Text representation of the type
  String? get text => textField.getValue(_json);

  /// Code representation of the type
  FixedList<Coding>? get coding => codingField.getValue(_json);

  /// Field definition for [text]
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
  );

  /// Field definition for [coding]
  static const codingField = FieldDefinition(
    name: 'coding',
    getValue: _getCoding,
  );

  /// All field definitions for [Type]
  static const fieldDefinitions = [
    textField,
    codingField,
  ];

  static String? _getText(JsonObject jo) =>
      jo.getValue(textField.name).stringValue;

  static FixedList<Coding>? _getCoding(JsonObject jo) => switch (jo['coding']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Coding.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  /// Converts this [Type] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Type && other.text == text && other.coding == coding);

  @override
  int get hashCode => text.hashCode ^ coding.hashCode;

  /// Creates a deep copy of this [Type].
  Type copyWith({
    String? text,
    FixedList<Coding>? coding,
  }) =>
      Type(
        text: text ?? this.text,
        coding: coding ?? this.coding,
      );
}
