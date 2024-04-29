// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/json_object.dart';
import 'package:fhir_client/models/basic_types/time.dart';

const _daysOfWeekField = 'daysOfWeek';
const _availableStartTimeField = 'availableStartTime';
const _availableEndTimeField = 'availableEndTime';

/// Represents the time during which the resource is available.
class AvailableTime extends JsonObject {
  /// Constructs a new [AvailableTime].
  AvailableTime({
    Definable<FixedList<String>> daysOfWeek = const Undefined(),
    Definable<Time> availableStartTime = const Undefined(),
    Definable<Time> availableEndTime = const Undefined(),
  }) : super({
          if (daysOfWeek is Defined<FixedList<String>>)
            _daysOfWeekField: daysOfWeek.value,
          if (availableStartTime is Defined<Time>)
            _availableStartTimeField: availableStartTime.value.toString(),
          if (availableEndTime is Defined<Time>)
            _availableEndTimeField: availableEndTime.value.toString(),
        });

  /// Constructs a new [AvailableTime]. This constructor treats nulls as undefined.
  AvailableTime.primitives({
    FixedList<String>? daysOfWeek,
    Time? availableStartTime,
    Time? availableEndTime,
  }) : super({
          if (daysOfWeek != null) _daysOfWeekField: daysOfWeek,
          if (availableStartTime != null)
            _availableStartTimeField: availableStartTime.toString(),
          if (availableEndTime != null)
            _availableEndTimeField: availableEndTime.toString(),
        });

  /// Creates an [AvailableTime] instance from the provided JSON object.
  AvailableTime.fromJson(super.json);

  /// The days of the week when the resource is available.
  ///
  /// Type: List<CodeType>
  /// Path: AvailableTime.daysOfWeek
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<String>> get daysOfWeek => getValueFromArray(
        _daysOfWeekField,
        (strings) => strings?.map((e) => e as String).toFixedList(),
      );

  /// The start time of availability.
  ///
  /// Type: TimeType
  /// Path: AvailableTime.availableStartTime
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Time> get availableStartTime => getValueFromString(
        _availableStartTimeField,
        tryParse: (t) => Time.tryParse(t ?? ''),
      );

  /// The end time of availability.
  ///
  /// Type: TimeType
  /// Path: AvailableTime.availableEndTime
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Time> get availableEndTime => getValueFromString(
        _availableEndTimeField,
        tryParse: (t) => Time.tryParse(t ?? ''),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AvailableTime &&
          other.daysOfWeek == daysOfWeek &&
          other.availableStartTime == availableStartTime &&
          other.availableEndTime == availableEndTime);

  @override
  int get hashCode =>
      daysOfWeek.hashCode ^
      availableStartTime.hashCode ^
      availableEndTime.hashCode;

  /// Creates a copy of the [AvailableTime] instance and allows
  /// for non-destructive mutation.
  AvailableTime copyWith({
    Definable<FixedList<String>>? daysOfWeek,
    Definable<Time>? availableStartTime,
    Definable<Time>? availableEndTime,
  }) =>
      AvailableTime(
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
        availableStartTime: availableStartTime ?? this.availableStartTime,
        availableEndTime: availableEndTime ?? this.availableEndTime,
      );
}
