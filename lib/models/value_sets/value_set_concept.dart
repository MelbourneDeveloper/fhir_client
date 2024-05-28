import 'package:jayse/jayse.dart';

/// A mixin that provides a common interface for all value set concepts.
mixin ValueSetConcept<T extends ValueSetConcept<T>> implements Comparable<T> {
  /// The property that represents the unique identifier
  /// for a specific concept within the value set.
  String get code;

  /// A human-readable string to display to the user.
  String get display;

  /// Provides a more detailed explanation or description of the concept
  String get definition;

  /// Converts the code to a [JsonString] for the purpose of JSON
  /// serialization
  JsonValue get json => JsonString(code);

  @override
  int compareTo(T other) => code.compareTo(other.code);
}
