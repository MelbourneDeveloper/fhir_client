import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A measured amount (or an amount that can potentially be measured).
/// Note that measured amounts include amounts that are not precisely
/// quantified, including amounts involving arbitrary units and floating
/// currencies.
class Quantity {

  /// Constructs a new [Quantity]
  Quantity({
    num? value,
    String? unit,
    Uri? system,
    String? code,
  }) : this.fromJson(
          JsonObject({
            if (value != null) valueField.name: JsonNumber(value),
            if (unit != null) unitField.name: JsonString(unit),
            if (system != null) systemField.name: JsonString(system.toString()),
            if (code != null) codeField.name: JsonString(code),
          }),
        );

  /// Constructs a new [Quantity] instance from the provided JSON object.
  Quantity.fromJson(this._json);

  final JsonObject _json;

  /// The value of the measured amount. The value includes an implicit
  /// precision in the presentation of the value.
  num? get value => valueField.getValue(_json);

  /// A human-readable form of the unit.
  String? get unit => unitField.getValue(_json);

  /// The identification of the system that provides the coded form of the unit.
  Uri? get system => systemField.getValue(_json);

  /// A computer processable form of the unit in some unit representation
  /// system.
  String? get code => codeField.getValue(_json);

  /// Field definition for [value]
  static const valueField = FieldDefinition(
    name: 'value',
    getValue: _getValue,
  );

  /// Field definition for [unit]
  static const unitField = FieldDefinition(
    name: 'unit',
    getValue: _getUnit,
  );

  /// Field definition for [system]
  static const systemField = FieldDefinition(
    name: 'system',
    getValue: _getSystem,
  );

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// All field definitions for [Quantity]
  static const fieldDefinitions = [
    valueField,
    unitField,
    systemField,
    codeField,
  ];

  static num? _getValue(JsonObject jo) =>
      jo.getValue(valueField.name).numericValue;

  static String? _getUnit(JsonObject jo) =>
      jo.getValue(unitField.name).stringValue;

  static Uri? _getSystem(JsonObject jo) {
    final value = jo.getValue(systemField.name).stringValue;
    return value != null ? Uri.parse(value) : null;
  }

  static String? _getCode(JsonObject jo) =>
      jo.getValue(codeField.name).stringValue;

  /// Converts this [Quantity] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quantity &&
          other.value == value &&
          other.unit == unit &&
          other.system == system &&
          other.code == code);

  @override
  int get hashCode =>
      value.hashCode ^ unit.hashCode ^ system.hashCode ^ code.hashCode;

  /// Makes a deep copy of this [Quantity].
  Quantity copyWith({
    num? value,
    String? unit,
    Uri? system,
    String? code,
  }) =>
      Quantity(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        system: system ?? this.system,
        code: code ?? this.code,
      );
}
