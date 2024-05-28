// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

/// The gender of a person used for administrative purposes.
enum AdministrativeGender with ValueSetConcept<AdministrativeGender> {
  /// Female.
  female(
    code: 'female',
    display: 'Female',
    definition: 'Female.',
  ),

  /// Male.
  male(
    code: 'male',
    display: 'Male',
    definition: 'Male.',
  ),

  /// Other.
  other(
    code: 'other',
    display: 'Other',
    definition: 'Other.',
  ),

  /// Unknown.
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
  @override
  final String code;

  /// A human-readable string to display to the user.
  @override
  final String display;

  /// Provides a more detailed explanation or description of the concept
  @override
  final String definition;

  /// Returns the enum value based on the string code, and returns null if
  /// no match is found
  static AdministrativeGender? fromCode(String code) => switch (code) {
        ('female') => AdministrativeGender.female,
        ('male') => AdministrativeGender.male,
        ('other') => AdministrativeGender.other,
        ('unknown') => AdministrativeGender.unknown,
        (_) => null,
      };
}
