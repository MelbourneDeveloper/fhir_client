import 'package:jayse/jayse.dart';

/// Extension methods for [JsonValue]
/// TODO: move to Jayse
extension JsonValueExtensions on JsonValue {
  /// Returns the value or null
  JsonObject? get objectValue => this is JsonObject ? this as JsonObject : null;

  /// Returns the value or null
  bool? get booleanValue =>
      this is JsonBoolean ? (this as JsonBoolean).value : null;

  /// Returns the value or null
  int? get integerValue => switch (this) {
        (final JsonNumber jn) when jn.value is int => jn.value as int,
        _ => null,
      };

  /// Returns the value or null
  DateTime? get dateTimeValue => switch (this) {
        (final JsonString js) => DateTime.tryParse(js.value),
        _ => null,
      };
}
