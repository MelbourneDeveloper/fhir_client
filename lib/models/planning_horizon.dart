import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Represents a time period defining a planning or scheduling scope.
class PlanningHorizon {
  /// Constructs a new [PlanningHorizon] with an optional start and end date.
  PlanningHorizon({
    DateTime? start,
    DateTime? end,
  }) : this.fromJson(
          JsonObject({
            if (start != null)
              startField.name: JsonString(start.toIso8601String()),
            if (end != null) endField.name: JsonString(end.toIso8601String()),
          }),
        );

  /// Constructs a new [PlanningHorizon] instance from the provided JSON object.
  PlanningHorizon.fromJson(this._json);

  final JsonObject _json;

  /// The start date of the planning horizon.
  DateTime? get start => startField.getValue(_json);

  /// The end date of the planning horizon.
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

  /// All field definitions for [PlanningHorizon]
  static const fieldDefinitions = [
    startField,
    endField,
  ];

  static DateTime? _getStart(JsonObject jo) {
    final value = jo.getValue(startField.name).stringValue;
    return value != null ? DateTime.tryParse(value) : null;
  }

  static DateTime? _getEnd(JsonObject jo) {
    final value = jo.getValue(endField.name).stringValue;
    return value != null ? DateTime.tryParse(value) : null;
  }

  /// Converts this [PlanningHorizon] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanningHorizon && other.start == start && other.end == end);

  @override
  int get hashCode => Object.hash(start, end);
}
