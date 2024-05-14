import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Represents a participant in a clinical or administrative process, 
/// potentially linked to a specific actor entity and with a status 
/// reflecting their role or involvement.
class Participant {

  /// Constructs a new [Participant].
  Participant({
    Actor? actor,
    String? status,
  }) : this.fromJson(
          JsonObject({
            if (actor != null) actorField.name: actor.json,
            if (status != null) statusField.name: JsonString(status),
          }),
        );

  /// Creates a new [Participant] instance from a [JsonObject].
  Participant.fromJson(this._json);

  final JsonObject _json;

  /// The underlying JSON object for this instance.
  JsonObject get json => _json;

  /// The actor involved in the event.
  Actor? get actor => actorField.getValue(_json);

  /// The status of participation (e.g., confirmed, declined).
  String? get status => statusField.getValue(_json);

  /// Field definition for [actor].
  static const actorField = FieldDefinition(
    name: 'actor',
    getValue: _getActor,
  );

  /// Field definition for [status].
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
  );

  /// All field definitions for [Participant].
  static const fieldDefinitions = [
    actorField,
    statusField,
  ];

  static Actor? _getActor(JsonObject jo) => jo['actor'] is JsonObject
      ? Actor.fromJson(jo['actor'] as JsonObject)
      : null;

  static String? _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name).stringValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Participant && other.actor == actor && other.status == status);

  @override
  int get hashCode => Object.hash(actor, status);

  /// Makes a copy of this [Participant] and allows for
  /// non-destructive mutation.
  Participant copyWith({
    Actor? actor,
    String? status,
  }) =>
      Participant(
        actor: actor ?? this.actor,
        status: status ?? this.status,
      );
}
