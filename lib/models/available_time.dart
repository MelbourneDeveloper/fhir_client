import 'package:fhir_client/models/fixed_list.dart';

class AvailableTime {
  AvailableTime({
    this.daysOfWeek,
    this.availableStartTime,
    this.availableEndTime,
  });

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
  final FixedList<String>? daysOfWeek;
  final String? availableStartTime;
  final String? availableEndTime;

  Map<String, dynamic> toJson() => {
        'daysOfWeek': daysOfWeek?.cast<dynamic>().toList(),
        'availableStartTime': availableStartTime,
        'availableEndTime': availableEndTime,
      };
}
