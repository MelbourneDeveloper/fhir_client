import 'package:fhir_client/models/fixed_list.dart';

/// Represents the time during which the resource is available.
class AvailableTime {
  /// Creates an instance of [AvailableTime].
  AvailableTime({
    this.daysOfWeek,
    this.availableStartTime,
    this.availableEndTime,
  });

  /// Creates an instance of [AvailableTime] from a JSON map.
  factory AvailableTime.fromJson(Map<String, dynamic> json) => AvailableTime(
        daysOfWeek: (json['daysOfWeek'] as List<dynamic>?)
            ?.cast<String>()
            .toFixedList(),
        availableStartTime: json['availableStartTime'] != null
            ? json['availableStartTime'] as String?
            : null,
        availableEndTime: json['availableEndTime'] != null
            ? json['availableEndTime'] as String?
            : null,
      );

  /// The days of the week when the resource is available.
  final FixedList<String>? daysOfWeek;

  /// The start time of availability.
  final String? availableStartTime;

  /// The end time of availability.
  final String? availableEndTime;

  /// Converts this [AvailableTime] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        'daysOfWeek': daysOfWeek?.cast<dynamic>().toList(),
        'availableStartTime': availableStartTime,
        'availableEndTime': availableEndTime,
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
}
