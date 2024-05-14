// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:jayse/jayse.dart';

/// Details for all kinds of technology-mediated contact points for a person or organization, including telephone, email, etc.
class ContactPoint {
  /// Constructs a new [ContactPoint] with optional extension, system, value and use.
  ContactPoint({
    FixedList<Extension>? extension,
    String? system,
    String? value,
    String? use,
  }) : this.fromJson(
          JsonObject({
            if (extension != null)
              extensionField.name:
                  JsonArray.unmodifiable(extension.map((e) => e.json)),
            if (system != null) systemField.name: JsonString(system),
            if (value != null) valueField.name: JsonString(value),
            if (use != null) useField.name: JsonString(use),
          }),
        );

  /// Constructs a new [ContactPoint] instance from the provided JSON object.
  ContactPoint.fromJson(this._json);

  final JsonObject _json;

  /// May be used to represent additional information that is not part of the basic definition of the element. To make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.
  FixedList<Extension>? get extension => extensionField.getValue(_json);

  /// Telecommunications form for contact point - what communications system is required to make use of the contact.
  String? get system => systemField.getValue(_json);

  /// The actual contact point details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
  String? get value => valueField.getValue(_json);

  /// Identifies the purpose for the contact point.
  String? get use => useField.getValue(_json);

  /// Field definition for [extension]
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
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

  /// All field definitions for [ContactPoint]
  static const fieldDefinitions = [
    extensionField,
    systemField,
    valueField,
    useField,
  ];

  static FixedList<Extension>? _getExtension(JsonObject jo) =>
      switch (jo['extension']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static String? _getSystem(JsonObject jo) =>
      jo.getValue(systemField.name).stringValue;

  static String? _getValue(JsonObject jo) =>
      jo.getValue(valueField.name).stringValue;

  static String? _getUse(JsonObject jo) =>
      jo.getValue(useField.name).stringValue;

  /// Converts this [ContactPoint] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactPoint &&
          other.extension == extension &&
          other.system == system &&
          other.value == value &&
          other.use == use);

  @override
  int get hashCode =>
      extension.hashCode ^ system.hashCode ^ value.hashCode ^ use.hashCode;

  /// Creates a deep copy of this [ContactPoint].
  ContactPoint copyWith({
    FixedList<Extension>? extension,
    String? system,
    String? value,
    String? use,
  }) =>
      ContactPoint(
        extension: extension ?? this.extension,
        system: system ?? this.system,
        value: value ?? this.value,
        use: use ?? this.use,
      );
}
