import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// The length of time the encounter lasted (less time absent).
class Length {
  /// Constructs a new [Length] with optional value, unit, system, and code.
  Length({
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

  /// Constructs a new [Length] instance from the provided JSON object.
  Length.fromJson(this._json);

  final JsonObject _json;

  /// The value of the length.
  num? get value => valueField.getValue(_json);

  /// The unit representation of the length.
  String? get unit => unitField.getValue(_json);

  /// The system that defines the coded unit form.
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

  /// All field definitions for [Length]
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

  /// Converts this [Length] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Length &&
          other.value == value &&
          other.unit == unit &&
          other.system == system &&
          other.code == code);

  @override
  int get hashCode =>
      value.hashCode ^ unit.hashCode ^ system.hashCode ^ code.hashCode;

  /// Creates a copy of the [Length] instance and allows for 
  /// non-destructive mutation.
  Length copyWith({
    num? value,
    String? unit,
    Uri? system,
    String? code,
  }) =>
      Length(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        system: system ?? this.system,
        code: code ?? this.code,
      );
}
