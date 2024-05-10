import 'package:jayse/jayse.dart';

/// Extension methods for [JsonValue]
/// TODO: move to Jayse
extension JsonValueExtensions on JsonValue {
  /// Returns the value or null
  JsonObject? get objectValue => this is JsonObject ? this as JsonObject : null;

}
