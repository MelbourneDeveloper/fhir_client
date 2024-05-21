import 'package:jayse/jayse.dart';

/// Extension methods for [JsonValue]
/// TODO: move to Jayse
extension JsonValueExtensions on JsonValue {
  /// Returns the value or null
  JsonObject? get objectValue => this is JsonObject ? this as JsonObject : null;
  Uri? get uriValue =>
      this is JsonString ? Uri.tryParse((this as JsonString).value) : null;
}
