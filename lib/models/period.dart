import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A time period defined by a start and end date/time.
class Period {
  /// Creates a new [Period] instance.
  Period({
    DateTime? start,
    DateTime? end,
  }) : this.fromJson(
          JsonObject({
            if (start != null)
              startField.name: JsonString(start.toIso8601String()),
            if (end != null) endField.name: JsonString(end.toIso8601String()),
          }),
        );

  /// Creates a new [Period] instance from a [JsonObject].
  Period.fromJson(this._json);

  final JsonObject _json;

  /// The start of the period. The boundary is inclusive.
  DateTime? get start => startField.getValue(_json);

  /// The end of the period. If the end of the period is missing, it means that the period is ongoing. The start may be in the past, and the end date in the future, which means that period is expected/planned to end at that time.
  DateTime? get end => endField.getValue(_json);

  /// Field definition for [start]
  static const startField = FieldDefinition(
    name: 'start',
    getValue: _getStart,
  );

  /// Field definition for [end]
  static const endField = FieldDefinition(
    name: 'end',
    getValue: _getEnd,
  );

  /// All field definitions for [Period]
  static const fieldDefinitions = [
    startField,
    endField,
  ];

  static DateTime? _getStart(JsonObject jo) =>
      jo.getValue(startField.name).dateTimeValue;

  static DateTime? _getEnd(JsonObject jo) =>
      jo.getValue(endField.name).dateTimeValue;

  /// Converts this [Period] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Period && other.start == start && other.end == end);

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  /// Makes a copy of this [Period]
  Period copyWith({
    DateTime? start,
    DateTime? end,
  }) =>
      Period(
        start: start ?? this.start,
        end: end ?? this.end,
      );
}
