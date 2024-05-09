// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/repeat.dart';
import 'package:jayse/jayse.dart';

/// Specifies an event that may occur multiple times.
/// Timing schedules are used to record when things are planned, expected or requested to occur.
/// The most common usage is in dosage instructions for medications.
/// They are also used when planning care of various kinds, and may be used for reporting the schedule to which past regular activities were carried out.
class Timing {
  /// Creates a new [Timing] instance.
  Timing({
    FixedList<DateTime>? event,
    Repeat? repeat,
    CodeableConcept? code,
  }) : this.fromJson(
          JsonObject({
            if (event != null)
              eventField.name: JsonArray.unmodifiable(
                event.map((e) => JsonString(e.toIso8601String())),
              ),
            if (repeat != null) repeatField.name: repeat.json,
            if (code != null) codeField.name: code.json,
          }),
        );

  /// Creates a new [Timing] instance from a [JsonObject].
  Timing.fromJson(this._json);

  final JsonObject _json;

  /// Identifies specific times when the event occurs.
  FixedList<DateTime>? get event => eventField.getValue(_json);

  /// A set of rules that describe when the event is scheduled.
  Repeat? get repeat => repeatField.getValue(_json);

  /// A code for the timing schedule (or just text in code.text).
  /// The code is interpreted in the context of the ValueSet specified in the containing resource,
  /// and may be a specific code, or a more general category, such as "BID" (twice a day) or "Q4H" (every 4 hours).
  CodeableConcept? get code => codeField.getValue(_json);

  /// Field definition for [event]
  static const eventField = FieldDefinition(
    name: 'event',
    getValue: _getEvent,
  );

  /// Field definition for [repeat]
  static const repeatField = FieldDefinition(
    name: 'repeat',
    getValue: _getRepeat,
  );

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// All field definitions for [Timing]
  static const fieldDefinitions = [
    eventField,
    repeatField,
    codeField,
  ];

  static FixedList<DateTime>? _getEvent(JsonObject jo) => switch (jo['event']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => DateTime.parse((e as JsonString).value)),
          ),
        _ => null,
      };

  static Repeat? _getRepeat(JsonObject jo) => switch (jo['repeat']) {
        (final JsonObject jsonObject) => Repeat.fromJson(jsonObject),
        _ => null,
      };

  static CodeableConcept? _getCode(JsonObject jo) => switch (jo['code']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  /// Converts this [Timing] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timing &&
          other.event == event &&
          other.repeat == repeat &&
          other.code == code);

  @override
  int get hashCode => event.hashCode ^ repeat.hashCode ^ code.hashCode;

  /// Creates a deep copy of this [Timing].
  Timing copyWith({
    FixedList<DateTime>? event,
    Repeat? repeat,
    CodeableConcept? code,
  }) =>
      Timing(
        event: event ?? this.event,
        repeat: repeat ?? this.repeat,
        code: code ?? this.code,
      );
}
