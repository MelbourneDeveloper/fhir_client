import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/string_backed_value.dart';
import 'package:fhir_client/models/basic_types/time.dart';

/// Represents the time during which the resource is available.
class AvailableTime {
  /// Creates an instance of [AvailableTime].
  AvailableTime({
    required this.availableStartTime,
    this.daysOfWeek,
    this.availableEndTime,
  });

  /// Creates an instance of [AvailableTime] from a JSON map.
  factory AvailableTime.fromJson(Map<String, dynamic> json) => AvailableTime(
        daysOfWeek: (json['daysOfWeek'] as List<dynamic>?)
            ?.cast<String>()
            .toFixedList(),
        availableStartTime:
            StringBackedValue(json['availableStartTime'] as String?),
        availableEndTime:
            Time.tryParse(json['availableEndTime'] as String? ?? ''),
      );

  /// The days of the week when the resource is available.
  final FixedList<String>? daysOfWeek;

  /// The start time of availability.
  final StringBackedValue<Time> availableStartTime;

  /// The end time of availability.
  final Time? availableEndTime;

  /// Converts this [AvailableTime] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        'daysOfWeek': daysOfWeek?.cast<dynamic>().toList(),
        'availableStartTime': availableStartTime.text,
        'availableEndTime': availableEndTime.toString(),
      };

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

  /// Makes a copy of this [AvailableTime] and allows for 
  /// non-destructive mutation.
  AvailableTime copyWith({
    FixedList<String>? daysOfWeek,
    StringBackedValue<Time>? availableStartTime,
    Time? availableEndTime,
  }) =>
      AvailableTime(
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
        availableStartTime: availableStartTime ?? this.availableStartTime,
        availableEndTime: availableEndTime ?? this.availableEndTime,
      );
}
