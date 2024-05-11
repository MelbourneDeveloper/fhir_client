import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:jayse/jayse.dart';

/// A name of a human with text, parts and usage information.
class HumanName {
  /// Constructs a new [HumanName] with optional family, use, given and prefix.
  HumanName({
    String? family,
    String? use,
    FixedList<String>? given,
    FixedList<String>? prefix,
  }) : this.fromJson(
          JsonObject({
            if (family != null) familyField.name: JsonString(family),
            if (use != null) useField.name: JsonString(use),
            if (given != null)
              givenField.name:
                  JsonArray.unmodifiable(given.map(JsonString.new)),
            if (prefix != null)
              prefixField.name:
                  JsonArray.unmodifiable(prefix.map(JsonString.new)),
          }),
        );

  /// Constructs a new [HumanName] instance from the provided JSON object.
  HumanName.fromJson(this._json);

  final JsonObject _json;

  /// Family name (often called 'Surname').
  ///
  /// Type: String
  /// Path: Name.family
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get family => familyField.getValue(_json);

  /// Identifies the purpose for this name.
  ///
  /// Type: Code
  /// Path: Name.use
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get use => useField.getValue(_json);

  /// Given names (not always 'first'). Includes middle names.
  ///
  /// Type: List<String>
  /// Path: Name.given
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<String>? get given => givenField.getValue(_json);

  /// Parts that come before the name.
  ///
  /// Type: List<String>
  /// Path: Name.prefix
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<String>? get prefix => prefixField.getValue(_json);

  /// Field definition for [family]
  static const familyField = FieldDefinition(
    name: 'family',
    getValue: _getFamily,
  );

  /// Field definition for [use]
  static const useField = FieldDefinition(
    name: 'use',
    getValue: _getUse,
  );

  /// Field definition for [given]
  static const givenField = FieldDefinition(
    name: 'given',
    getValue: _getGiven,
  );

  /// Field definition for [prefix]
  static const prefixField = FieldDefinition(
    name: 'prefix',
    getValue: _getPrefix,
  );

  /// All field definitions for [HumanName]
  static const fieldDefinitions = [
    familyField,
    useField,
    givenField,
    prefixField,
  ];

  static String? _getFamily(JsonObject jo) =>
      jo.getValue(familyField.name).stringValue;

  static String? _getUse(JsonObject jo) =>
      jo.getValue(useField.name).stringValue;

  static FixedList<String>? _getGiven(JsonObject jo) => switch (jo['given']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.whereType<String>()),
        _ => null,
      };

  static FixedList<String>? _getPrefix(JsonObject jo) => switch (jo['prefix']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.whereType<String>()),
        _ => null,
      };

  /// Converts this [HumanName] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HumanName &&
          other.family == family &&
          other.use == use &&
          other.given == given &&
          other.prefix == prefix);

  @override
  int get hashCode =>
      family.hashCode ^ use.hashCode ^ given.hashCode ^ prefix.hashCode;

  /// Makes a copy of this [HumanName] but with the given fields updated.
  HumanName copyWith({
    String? family,
    String? use,
    FixedList<String>? given,
    FixedList<String>? prefix,
  }) =>
      HumanName(
        family: family ?? this.family,
        use: use ?? this.use,
        given: given ?? this.given,
        prefix: prefix ?? this.prefix,
      );
}
