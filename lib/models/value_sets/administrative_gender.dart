import 'package:jayse/jayse.dart';

/// The gender of a person used for administrative purposes.
enum AdministrativeGender implements Comparable<AdministrativeGender> {
  /// 'Male.'
  male(
    code: 'male',
    display: 'Male',
    definition: 'Male.',
  ),

  /// 'Female.'
  female(
    code: 'female',
    display: 'Female',
    definition: 'Female.',
  ),

  /// 'Other.'
  other(
    code: 'other',
    display: 'Other',
    definition: 'Other.',
  ),

  /// 'Unknown.'
  unknown(
    code: 'unknown',
    display: 'Unknown',
    definition: 'Unknown.',
  );

  const AdministrativeGender({
    required this.code,
    required this.display,
    required this.definition,
  });

  /// The property that represents the unique identifier
  /// for a specific concept within the value set.
  final String code;

  /// A human-readable string to display to the user.
  final String display;

  /// Provides a more detailed explanation or description of the concept
  final String definition;

  /// Returns the enum value based on the string code, and returns null if
  /// no match is found
  static AdministrativeGender? fromCode(String code) => switch (code) {
        ('male') => AdministrativeGender.male,
        ('female') => AdministrativeGender.female,
        ('other') => AdministrativeGender.other,
        ('unknown') => AdministrativeGender.unknown,
        (_) => null,
      };

  JsonValue get json => JsonString(code);

  @override
  int compareTo(AdministrativeGender other) => code == other.code ? 0 : 1;
}
