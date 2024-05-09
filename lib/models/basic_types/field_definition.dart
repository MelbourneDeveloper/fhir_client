// ignore_for_file: lines_longer_than_80_chars

import 'package:jayse/jayse.dart';

/// FHIR specific metadata about the field
class FieldDefinition<T> {
  const FieldDefinition({
    required this.name,
    required this.getValue,
  });

  /// Returns the value of the field from the provided [JsonObject].
  final JsonValue Function(JsonObject) getValue;

  /// The name of the field.
  final String name;

  MapEntry<String, dynamic> toMapEntry(JsonValue definable) =>
      //TODO: is this ok?
      MapEntry(name, definable);

  //TODO: Cardinality etc.
}
