// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/json_object.dart';

const _referenceField = 'reference';
const _displayField = 'display';

/// Participant involved in the resource.
class Actor extends JsonObject {

  /// Constructs a new [Actor]
  Actor({
    Definable<String> reference = const Undefined(),
    Definable<String> display = const Undefined(),
  }) : super({
          if (reference is Defined<String>) _referenceField: reference.value,
          if (display is Defined<String>) _displayField: display.value,
        });

  /// Constructs a new [Actor]. This constructor treats nulls as undefined.
  Actor.primitives({
    String? reference,
    String? display,
  }) : super({
          if (reference != null) 'reference': reference,
          if (display != null) 'display': display,
        });

  /// Creates an [Actor] instance from the provided JSON object.
  Actor.fromJson(super.json);

  /// The reference to the participant.
  ///
  /// Type: ReferenceType
  /// Path: Actor.reference
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get reference => getValue(_referenceField);

  /// The display name of the participant.
  ///
  /// Type: StringType
  /// Path: Actor.display
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get display => getValue(_displayField);

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
    Definable<String>? reference,
    Definable<String>? display,
  }) =>
      Actor(
        reference: reference ?? this.reference,
        display: display ?? this.display,
      );
}
