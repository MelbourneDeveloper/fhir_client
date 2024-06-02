// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:jayse/jayse.dart';

class Settings {
  Settings({
    bool isDarkMode = false,
    Uri? baseUri,
  }) : json = JsonObject({
          'baseUri': JsonString(baseUri.toString()),
          'isDarkMode': JsonString(isDarkMode.toString()),
        });

  Settings.fromJson(this.json);

  Uri? get baseUri => switch (json['baseUri']) {
        (final JsonString js) => Uri.tryParse(js.value),
        (_) => null
      };

  bool? get isDarkMode => switch (json['isDarkMode']) {
        (final JsonString js) => bool.tryParse(js.value),
        (_) => null
      };

  final JsonObject json;

  @override
  bool operator ==(Object other) => other is Settings && other.json == json;

  @override
  int get hashCode => json.hashCode;

  Settings copyWith({
    Uri? baseUri,
    bool? isDarkMode,
  }) =>
      Settings(
        isDarkMode: isDarkMode ?? this.isDarkMode ?? false,
        baseUri: baseUri ?? this.baseUri,
      );

  @override
  String toString() => json.toString();
}
