// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/models/range.dart';
import 'package:jayse/jayse.dart';

/// Reference range for the observation.
class ObservationReferenceRange {
  /// Constructs a new [ObservationReferenceRange] with optional low, high, type, appliesTo, age, and text.
  ObservationReferenceRange({
    Quantity? low,
    Quantity? high,
    CodeableConcept? type,
    FixedList<CodeableConcept>? appliesTo,
    Range? age,
    String? text,
  }) : this.fromJson(
          JsonObject({
            if (low != null) lowField.name: low.json,
            if (high != null) highField.name: high.json,
            if (type != null) typeField.name: type.json,
            if (appliesTo != null)
              appliesToField.name:
                  JsonArray.unmodifiable(appliesTo.map((e) => e.json)),
            if (age != null) ageField.name: age.json,
            if (text != null) textField.name: JsonString(text),
          }),
        );

  /// Constructs a new [ObservationReferenceRange] instance from the provided JSON object.
  ObservationReferenceRange.fromJson(this._json);

  final JsonObject _json;

  /// The value of the low bound of the reference range.
  /// The low bound of the reference range endpoint is inclusive of the value (e.g. reference range is >=5 - <=9).
  /// If the low bound is omitted, it is assumed to be meaningless (e.g. reference range is <=2.3).
  Quantity? get low => lowField.getValue(_json);

  /// The value of the high bound of the reference range.
  /// The high bound of the reference range endpoint is inclusive of the value (e.g. reference range is >=5 - <=9).
  /// If the high bound is omitted, it is assumed to be meaningless (e.g. reference range is >= 2.3).
  Quantity? get high => highField.getValue(_json);

  /// Codes to indicate the what part of the targeted reference population it applies to.
  /// For example, the normal or therapeutic range.
  CodeableConcept? get type => typeField.getValue(_json);

  /// Codes to indicate the target population this reference range applies to.
  /// For example, a reference range may be based on the normal population or a particular sex or race.
  FixedList<CodeableConcept>? get appliesTo => appliesToField.getValue(_json);

  /// The age at which this reference range is applicable.
  /// This is a neonatal age (e.g. number of weeks at term) if the meaning says so.
  Range? get age => ageField.getValue(_json);

  /// Text based reference range in an observation which may be used when a quantitative range is not appropriate for an observation.
  /// An example would be a reference value of "Negative" or a list or table of 'normals'.
  String? get text => textField.getValue(_json);

  /// Field definition for [low]
  static const lowField = FieldDefinition(
    name: 'low',
    getValue: _getLow,
  );

  /// Field definition for [high]
  static const highField = FieldDefinition(
    name: 'high',
    getValue: _getHigh,
  );

  /// Field definition for [type]
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [appliesTo]
  static const appliesToField = FieldDefinition(
    name: 'appliesTo',
    getValue: _getAppliesTo,
  );

  /// Field definition for [age]
  static const ageField = FieldDefinition(
    name: 'age',
    getValue: _getAge,
  );

  /// Field definition for [text]
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
  );

  /// All field definitions for [ObservationReferenceRange]
  static const fieldDefinitions = [
    lowField,
    highField,
    typeField,
    appliesToField,
    ageField,
    textField,
  ];

  static Quantity? _getLow(JsonObject jo) => switch (jo['low']) {
        (final JsonObject jsonObject) => Quantity.fromJson(jsonObject),
        _ => null,
      };

  static Quantity? _getHigh(JsonObject jo) => switch (jo['high']) {
        (final JsonObject jsonObject) => Quantity.fromJson(jsonObject),
        _ => null,
      };

  static CodeableConcept? _getType(JsonObject jo) => switch (jo['type']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getAppliesTo(JsonObject jo) =>
      switch (jo['appliesTo']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static Range? _getAge(JsonObject jo) => switch (jo['age']) {
        (final JsonObject jsonObject) => Range.fromJson(jsonObject),
        _ => null,
      };

  static String? _getText(JsonObject jo) =>
      jo.getValue(textField.name).stringValue;

  /// Converts this [ObservationReferenceRange] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationReferenceRange &&
          other.low == low &&
          other.high == high &&
          other.type == type &&
          other.appliesTo == appliesTo &&
          other.age == age &&
          other.text == text);

  @override
  int get hashCode =>
      low.hashCode ^
      high.hashCode ^
      type.hashCode ^
      appliesTo.hashCode ^
      age.hashCode ^
      text.hashCode;

  /// Creates a copy of this [ObservationReferenceRange] but with the given fields updated.
  ObservationReferenceRange copyWith({
    Quantity? low,
    Quantity? high,
    CodeableConcept? type,
    FixedList<CodeableConcept>? appliesTo,
    Range? age,
    String? text,
  }) =>
      ObservationReferenceRange(
        low: low ?? this.low,
        high: high ?? this.high,
        type: type ?? this.type,
        appliesTo: appliesTo ?? this.appliesTo,
        age: age ?? this.age,
        text: text ?? this.text,
      );
}
