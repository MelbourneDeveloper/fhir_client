import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A set of ordered Quantities defined by a low and high limit.
class Range {
  /// Constructs a new [Range] with an optional low and high limit.
  Range({
    Quantity? low,
    Quantity? high,
  }) : this.fromJson(
          JsonObject({
            if (low != null) lowField.name: low.json,
            if (high != null) highField.name: high.json,
          }),
        );

  /// Constructs a new [Range] instance from the provided JSON object.
  Range.fromJson(this._json);

  final JsonObject _json;

  /// The low limit. The boundary is inclusive.
  Quantity? get low => lowField.getValue(_json);

  /// The high limit. The boundary is inclusive.
  Quantity? get high => highField.getValue(_json);

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

  /// All field definitions for [Range]
  static const fieldDefinitions = [
    lowField,
    highField,
  ];

  static Quantity? _getLow(JsonObject jo) => switch (jo['low']) {
        (final JsonObject jsonObject) => Quantity.fromJson(jsonObject),
        _ => null,
      };

  static Quantity? _getHigh(JsonObject jo) => switch (jo['high']) {
        (final JsonObject jsonObject) => Quantity.fromJson(jsonObject),
        _ => null,
      };

  /// Converts this [Range] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Range && other.low == low && other.high == high);

  @override
  int get hashCode => low.hashCode ^ high.hashCode;

  /// Creates a deep copy of this [Range].
  Range copyWith({
    Quantity? low,
    Quantity? high,
  }) =>
      Range(
        low: low ?? this.low,
        high: high ?? this.high,
      );
}
