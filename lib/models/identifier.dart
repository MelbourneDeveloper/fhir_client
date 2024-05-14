// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/type.dart';
import 'package:jayse/jayse.dart';

/// A numeric or alphanumeric string that is associated with a single object or entity within a given system.
/// Typically, identifiers are used to connect content in resources to external content available in other frameworks or protocols.
/// Identifiers are associated with objects, and may be changed or retired due to human or system process and errors.
class Identifier {
  /// Creates a new [Identifier] instance.
  Identifier({
    Type? type,
    Uri? system,
    String? value,
    String? use,
  }) : this.fromJson(
          JsonObject({
            if (type != null) typeField.name: type.json,
            if (system != null) systemField.name: JsonString(system.toString()),
            if (value != null) valueField.name: JsonString(value),
            if (use != null) useField.name: JsonString(use),
          }),
        );

  /// Creates a new [Identifier] instance from the provided JSON object.
  Identifier.fromJson(this._json);

  final JsonObject _json;

  /// The type for the identifier that can be used to determine which identifier to use for a specific purpose.
  Type? get type => typeField.getValue(_json);

  /// Establishes the namespace for the value - that is, a URL that describes a set values that are unique.
  Uri? get system => systemField.getValue(_json);

  /// The portion of the identifier typically relevant to the user and which is unique within the context of the system.
  String? get value => valueField.getValue(_json);

  /// A coded value that defines the purpose of the identifier.
  String? get use => useField.getValue(_json);

  /// Field definition for [type]
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [system]
  static const systemField = FieldDefinition(
    name: 'system',
    getValue: _getSystem,
  );

  /// Field definition for [value]
  static const valueField = FieldDefinition(
    name: 'value',
    getValue: _getValue,
  );

  /// Field definition for [use]
  static const useField = FieldDefinition(
    name: 'use',
    getValue: _getUse,
  );

  /// All field definitions for [Identifier]
  static const fieldDefinitions = [
    typeField,
    systemField,
    valueField,
    useField,
  ];

  static Type? _getType(JsonObject jo) => switch (jo['type']) {
        (final JsonObject jsonObject) => Type.fromJson(jsonObject),
        _ => null,
      };

  static Uri? _getSystem(JsonObject jo) {
    final value = jo.getValue(systemField.name).stringValue;
    return value != null ? Uri.parse(value) : null;
  }

  static String? _getValue(JsonObject jo) =>
      jo.getValue(valueField.name).stringValue;

  static String? _getUse(JsonObject jo) =>
      jo.getValue(useField.name).stringValue;

  /// Converts this [Identifier] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Identifier &&
          other.type == type &&
          other.system == system &&
          other.value == value &&
          other.use == use);

  @override
  int get hashCode =>
      type.hashCode ^ system.hashCode ^ value.hashCode ^ use.hashCode;

  /// Makes a deep copy of this [Identifier].
  Identifier copyWith({
    Type? type,
    Uri? system,
    String? value,
    String? use,
  }) =>
      Identifier(
        type: type ?? this.type,
        system: system ?? this.system,
        value: value ?? this.value,
        use: use ?? this.use,
      );
}
