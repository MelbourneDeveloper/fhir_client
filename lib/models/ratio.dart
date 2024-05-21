import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A relationship of two Quantity values - expressed as a numerator and a
/// denominator.
class Ratio {
  /// Constructs a new [Ratio] with optional numerator and denominator.
  Ratio({
    Quantity? numerator,
    Quantity? denominator,
  }) : this.fromJson(
          JsonObject({
            if (numerator != null) numeratorField.name: numerator.json,
            if (denominator != null) denominatorField.name: denominator.json,
          }),
        );

  /// Constructs a new [Ratio] instance from the provided JSON object.
  Ratio.fromJson(this._json);

  final JsonObject _json;

  /// The value of the numerator in the ratio.
  Quantity? get numerator => numeratorField.getValue(_json);

  /// The value of the denominator in the ratio.
  Quantity? get denominator => denominatorField.getValue(_json);

  /// Field definition for [numerator]
  static const numeratorField = FieldDefinition(
    name: 'numerator',
    getValue: _getNumerator,
  );

  /// Field definition for [denominator]
  static const denominatorField = FieldDefinition(
    name: 'denominator',
    getValue: _getDenominator,
  );

  /// All field definitions for [Ratio]
  static const fieldDefinitions = [
    numeratorField,
    denominatorField,
  ];

  static Quantity? _getNumerator(JsonObject jo) => switch (jo['numerator']) {
        (final JsonObject jo) => Quantity.fromJson(jo),
        _ => null,
      };

  static Quantity? _getDenominator(JsonObject jo) =>
      switch (jo['denominator']) {
        (final JsonObject jo) => Quantity.fromJson(jo),
        _ => null,
      };

  /// Converts this [Ratio] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ratio &&
          other.numerator == numerator &&
          other.denominator == denominator);

  @override
  int get hashCode => Object.hash(numerator, denominator);

  /// Creates a deep copy of this [Ratio].
  Ratio copyWith({
    Quantity? numerator,
    Quantity? denominator,
  }) =>
      Ratio(
        numerator: numerator ?? this.numerator,
        denominator: denominator ?? this.denominator,
      );
}
