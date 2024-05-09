import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Details and position information for a physical place where services are 
/// provided and resources and participants may be stored, found, contained, 
/// or accommodated.
class Location {

  /// Constructs a new [Location] with an optional reference.
  Location({
    String? reference,
  }) : this.fromJson(
          JsonObject({
            if (reference != null) referenceField.name: JsonString(reference),
          }),
        );

  /// Constructs a new [Location] instance from the provided JSON object.
  Location.fromJson(this._json);

  final JsonObject _json;

  /// Literal reference, Relative, internal or absolute URL.
  String? get reference => referenceField.getValue(_json);

  /// Field definition for [reference]
  static const referenceField = FieldDefinition(
    name: 'reference',
    getValue: _getReference,
  );

  /// All field definitions for [Location]
  static const fieldDefinitions = [
    referenceField,
  ];

  static String? _getReference(JsonObject jo) =>
      jo.getValue(referenceField.name).stringValue;

  /// Converts this [Location] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location && other.reference == reference);

  @override
  int get hashCode => reference.hashCode;
}
