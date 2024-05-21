import 'package:jayse/jayse.dart';

const administrativeGenderUri = 'http://hl7.org/fhir/administrative-gender';

/// The gender of a person used for administrative purposes.
enum AdministrativeGender implements Comparable<AdministrativeGender> {
  male(
    code: 'male',
    display: 'Male',
    system: administrativeGenderUri,
  ),
  female(
    code: 'female',
    display: 'Female',
    system: administrativeGenderUri,
  ),
  other(
    code: 'other',
    display: 'Other',
    system: administrativeGenderUri,
  ),
  unknown(
    code: 'unknown',
    display: 'Unknown',
    system: administrativeGenderUri,
  );

  const AdministrativeGender({
    required this.code,
    required this.display,
    required this.system,
  });

  final String code;
  final String display;
  final String system;

  /// Returns the gender based on the string code, and returns unknown if
  /// no match is found
  static AdministrativeGender fromCode(String code) => switch (code) {
        ('male') => AdministrativeGender.male,
        ('female') => AdministrativeGender.female,
        ('other') => AdministrativeGender.other,
        (_) => AdministrativeGender.unknown,
      };

  JsonValue get json => JsonString(code);

  @override
  int compareTo(AdministrativeGender other) => code == other.code ? 0 : 1;
}
