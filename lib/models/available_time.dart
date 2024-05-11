import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/time.dart';
import 'package:jayse/jayse.dart';

/// Represents the time during which the resource is available.
class AvailableTime {
  /// Constructs a new [AvailableTime].
  AvailableTime({
    FixedList<String>? daysOfWeek,
    Time? availableStartTime,
    Time? availableEndTime,
  }) : this.fromJson(
          JsonObject({
            if (daysOfWeek != null)
              daysOfWeekField.name: JsonArray.unmodifiable(
                daysOfWeek.map(JsonString.new),
              ),
            if (availableStartTime != null)
              availableStartTimeField.name:
                  JsonString(availableStartTime.toString()),
            if (availableEndTime != null)
              availableEndTimeField.name:
                  JsonString(availableEndTime.toString()),
          }),
        );

  /// Creates an [AvailableTime] instance from the provided JSON object.
  AvailableTime.fromJson(this._json);

  final JsonObject _json;

  /// The days of the week when the resource is available.
  ///
  /// Type: List<CodeType>
  /// Path: AvailableTime.daysOfWeek
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<String>? get daysOfWeek => daysOfWeekField.getValue(_json);

  /// The start time of availability.
  ///
  /// Type: TimeType
  /// Path: AvailableTime.availableStartTime
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Time? get availableStartTime => availableStartTimeField.getValue(_json);

  /// The end time of availability.
  ///
  /// Type: TimeType
  /// Path: AvailableTime.availableEndTime
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Time? get availableEndTime => availableEndTimeField.getValue(_json);

  /// Field definition for [daysOfWeek]
  static const daysOfWeekField = FieldDefinition(
    name: 'daysOfWeek',
    getValue: _getDaysOfWeek,
  );

  /// Field definition for [availableStartTime]
  static const availableStartTimeField = FieldDefinition(
    name: 'availableStartTime',
    getValue: _getAvailableStartTime,
  );

  /// Field definition for [availableEndTime]
  static const availableEndTimeField = FieldDefinition(
    name: 'availableEndTime',
    getValue: _getAvailableEndTime,
  );

  /// All field definitions for [AvailableTime]
  static const fieldDefinitions = [
    daysOfWeekField,
    availableStartTimeField,
    availableEndTimeField,
  ];

  static FixedList<String>? _getDaysOfWeek(JsonObject jo) =>
      switch (jo['daysOfWeek']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.whereType<String>()),
        _ => null,
      };

  static Time? _getAvailableStartTime(JsonObject jo) => Time.tryParse(
        jo.getValue(availableStartTimeField.name).stringValue ?? '',
      );

  static Time? _getAvailableEndTime(JsonObject jo) =>
      Time.tryParse(jo.getValue(availableEndTimeField.name).stringValue ?? '');

  /// Converts this [AvailableTime] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is AvailableTime && json == other.json);

  @override
  int get hashCode => Object.hash(runtimeType.hashCode, json.hashCode);

  /// Creates a copy of the [AvailableTime] instance and allows
  /// for non-destructive mutation.
  AvailableTime copyWith({
    FixedList<String>? daysOfWeek,
    Time? availableStartTime,
    Time? availableEndTime,
  }) =>
      AvailableTime(
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
        availableStartTime: availableStartTime ?? this.availableStartTime,
        availableEndTime: availableEndTime ?? this.availableEndTime,
      );
}
