// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Base definition for all elements that are defined inside a resource - but not those in a data type.
class BackboneElement {
  /// Constructs a new [BackboneElement].
  BackboneElement({
    String? id,
    FixedList<Extension>? extension,
    FixedList<Extension>? modifierExtension,
  }) : this.fromJson(
          JsonObject({
            if (id != null) idField.name: JsonString(id),
            if (extension != null)
              extensionField.name:
                  JsonArray.unmodifiable(extension.map((e) => e.json)),
            if (modifierExtension != null)
              modifierExtensionField.name:
                  JsonArray.unmodifiable(modifierExtension.map((e) => e.json)),
          }),
        );

  /// Creates a [BackboneElement] instance from the provided JSON object.
  BackboneElement.fromJson(this._json);

  final JsonObject _json;

  /// Unique id for the element within a resource (for internal references).
  ///
  /// Type: String
  /// Path: BackboneElement.id
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get id => idField.getValue(_json);

  /// May be used to represent additional information that is not part of the basic definition of the element.
  ///
  /// Type: Extension
  /// Path: BackboneElement.extension
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<Extension>? get extension => extensionField.getValue(_json);

  /// May be used to represent additional information that is not part of the basic definition of the element and that modifies the understanding of the element in which it is contained and/or the understanding of the containing element's descendants.
  ///
  /// Type: Extension
  /// Path: BackboneElement.modifierExtension
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<Extension>? get modifierExtension =>
      modifierExtensionField.getValue(_json);

  /// Field definition for [id]
  static const idField = FieldDefinition(
    name: 'id',
    getValue: _getId,
  );

  /// Field definition for [extension]
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
  );

  /// Field definition for [modifierExtension]
  static const modifierExtensionField = FieldDefinition(
    name: 'modifierExtension',
    getValue: _getModifierExtension,
  );

  /// All field definitions for [BackboneElement]
  static const fieldDefinitions = [
    idField,
    extensionField,
    modifierExtensionField,
  ];

  static String? _getId(JsonObject jo) => jo.getValue(idField.name).stringValue;

  static FixedList<Extension>? _getExtension(JsonObject jo) =>
      switch (jo['extension']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Extension>? _getModifierExtension(JsonObject jo) =>
      switch (jo['modifierExtension']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  /// Converts this [BackboneElement] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackboneElement && json == other.json);

  @override
  int get hashCode => Object.hash(runtimeType.hashCode, json.hashCode);

  /// Creates a copy of the [BackboneElement] instance and allows for non-destructive mutation.
  BackboneElement copyWith({
    String? id,
    FixedList<Extension>? extension,
    FixedList<Extension>? modifierExtension,
  }) =>
      BackboneElement(
        id: id ?? this.id,
        extension: extension ?? this.extension,
        modifierExtension: modifierExtension ?? this.modifierExtension,
      );
}
