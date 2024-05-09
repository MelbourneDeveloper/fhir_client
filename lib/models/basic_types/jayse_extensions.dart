import 'package:jayse/jayse.dart';

extension JsonValueExtensions on JsonValue {
  /// Returns the value or null
  JsonObject? get objectValue => this is JsonObject ? this as JsonObject : null;
}
