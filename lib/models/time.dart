// ignore_for_file: lines_longer_than_80_chars


/// A time during the day, with no date specified.
class Time {
  Time({this.value});

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        value: json['value'] as String?,
      );

  /// A string representation of the time, as it appears in the text of the narrative.
  final String? value;

  Map<String, dynamic> toJson() => {
        'value': value,
      };
}
