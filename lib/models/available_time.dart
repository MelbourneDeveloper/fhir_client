// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class AvailableTime {
  final List<String>? daysOfWeek;
  final String? availableStartTime;
  final String? availableEndTime;

  AvailableTime({
    this.daysOfWeek,
    this.availableStartTime,
    this.availableEndTime,
  });

  factory AvailableTime.fromJson(Map<String, dynamic> json) {
    return AvailableTime(
      daysOfWeek:
          (json['daysOfWeek'] as List<dynamic>?)?.cast<String>().toList(),
      availableStartTime: json['availableStartTime'] != null
          ? json['availableStartTime'] as String?
          : null,
      availableEndTime: json['availableEndTime'] != null
          ? json['availableEndTime'] as String?
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'daysOfWeek': daysOfWeek?.cast<dynamic>().toList(),
      'availableStartTime': availableStartTime,
      'availableEndTime': availableEndTime,
    };
  }
}
