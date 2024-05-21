// ignore_for_file: lines_longer_than_80_chars

extension StringExtensions on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
