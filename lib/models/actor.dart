// ignore_for_file: lines_longer_than_80_chars

import 'package:jayse/jayse.dart';

const _referenceField = 'reference';
const _displayField = 'display';

/// Participant involved in the resource.
class Actor {
  /// Creates a new [Actor] instance.
  Actor({
    String? reference,
    String? display,
  }) : this.fromJson(
          JsonObject(<String, JsonValue>{
            if (reference != null) 'reference': JsonString(reference),
            if (display != null) 'display': JsonString(display),
          }),
        );

  /// Constructs a new [Actor] from a [JsonObject].
  Actor.fromJson(this._json);

  final JsonObject _json;

  /// The underlying JSON object for this instance.
  JsonObject get json => _json;

  /// The reference to the participant.
  ///
  /// Type: ReferenceType
  /// Path: Actor.reference
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get reference => _json[_referenceField].stringValue;

  /// The display name of the participant.
  ///
  /// Type: StringType
  /// Path: Actor.display
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get display => _json[_displayField].stringValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Actor &&
          other.reference == reference &&
          other.display == display);

  @override
  int get hashCode => Object.hash(reference, display);

  /// Creates a copy of the [Actor] instance and allows
  /// for non-destructive mutation
  Actor copyWith({
    String? reference,
    String? display,
  }) =>
      Actor(
        reference: reference ?? this.reference,
        display: display ?? this.display,
      );
}
