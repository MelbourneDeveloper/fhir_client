/// A time during the day, in the format hh:mm:ss (a subset of ISO8601 icon).
/// There is no date specified. Seconds must be provided due to schema type
/// constraints but may be zero-filled and may be ignored at receiver
/// discretion. The time "24:00" SHALL NOT be used. A timezone offset SHALL
/// NOT be present. Times can be converted to a Duration since midnight.
class Time {
  /// Creates a [Time] instance
  Time({
    required this.hour,
    required this.minute,
    this.second = 0,
  })  : assert(hour >= 0 && hour <= 23, 'Hour must be between 0 and 23'),
        assert(minute >= 0 && minute <= 59, 'Minute must be between 0 and 59'),
        assert(second >= 0 && second <= 59, 'Second must be between 0 and 59');

  /// The hour of the time
  final int hour;

  /// The minute of the time
  final int minute;

  /// The second of the time
  final int second;

  @override
  String toString() =>
      '${_padDigit(hour)}:${_padDigit(minute)}:${_padDigit(second)}';

  static String _padDigit(int value) => value.toString().padLeft(2, '0');

  /// Returns the [Time] by parsing a time string in the format hh:mm:ss
  /// or null if the string does not match
  static Time? tryParse(String timeString) {
    final parts = timeString.split(':');
    if (parts.length < 2) return null;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    final second = parts.length == 2 ? 0 : int.tryParse(parts[2]);

    if (hour == null || hour < 0 || hour > 23) return null;
    if (minute == null || minute < 0 || minute > 59) return null;
    if (second == null || second < 0 || second > 59) return null;

    return Time(hour: hour, minute: minute, second: second);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Time &&
          other.hour == hour &&
          other.minute == minute &&
          other.second == second;

  @override
  int get hashCode => Object.hash(hour, minute, second);
}
