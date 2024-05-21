import 'package:jayse/jayse.dart';

const maritalStatusUri = 'http://hl7.org/fhir/marital-status';

/// The domestic partnership status of a person.
enum MaritalStatus implements Comparable<MaritalStatus> {
  /// Never Married
  neverMarried(
    code: 'NM',
    display: 'Never Married',
    definition: 'The person has never been married.',
    system: maritalStatusUri,
  ),

  /// Widowed
  widowed(
    code: 'W',
    display: 'Widowed',
    definition: "The person's spouse has died.",
    system: maritalStatusUri,
  ),

  /// Divorced
  divorced(
    code: 'D',
    display: 'Divorced',
    definition: 'The person is divorced.',
    system: maritalStatusUri,
  ),

  /// Separated
  separated(
    code: 'S',
    display: 'Separated',
    definition: 'The person is legally separated from a spouse.',
    system: maritalStatusUri,
  ),

  /// Interlocutory
  interlocutory(
    code: 'I',
    display: 'Interlocutory',
    definition: 'The person has filed for a legal separation or divorce.',
    system: maritalStatusUri,
  ),

  /// Legally Married
  legallyMarried(
    code: 'L',
    display: 'Legally Married',
    definition: 'The person is legally married.',
    system: maritalStatusUri,
  ),

  /// Polygamous
  polygamous(
    code: 'P',
    display: 'Polygamous',
    definition: 'The person has more than one current legal spouse.',
    system: maritalStatusUri,
  ),

  /// Domestic partner
  domesticPartner(
    code: 'T',
    display: 'Domestic partner',
    definition:
        'The person declares that a domestic partner relationship exists.',
    system: maritalStatusUri,
  ),

  /// Unmarried
  unmarried(
    code: 'U',
    display: 'Unmarried',
    definition: 'The person is not married.',
    system: maritalStatusUri,
  ),

  /// Unknown
  unknown(
    code: 'UNK',
    display: 'Unknown',
    definition:
        'A proper value is applicable, but not known. Usage Notes: This '
        'means the actual value is not known. If the only thing that is '
        'unknown is how to properly express the value in the '
        'necessary constraints (value set, of a particular unit of'
        ' measure), then the OTH or UNC values should be used instead.',
    system: maritalStatusUri,
  );

  const MaritalStatus({
    required this.code,
    required this.display,
    required this.definition,
    required this.system,
  });

  final String code;
  final String display;
  final String definition;
  final String system;

  /// Returns the marital status based on the string code, and returns null if
  /// no match is found
  static MaritalStatus? fromCode(String code) => switch (code) {
        ('NM') => MaritalStatus.neverMarried,
        ('W') => MaritalStatus.widowed,
        ('D') => MaritalStatus.divorced,
        ('S') => MaritalStatus.separated,
        ('I') => MaritalStatus.interlocutory,
        ('L') => MaritalStatus.legallyMarried,
        ('P') => MaritalStatus.polygamous,
        ('T') => MaritalStatus.domesticPartner,
        ('U') => MaritalStatus.unmarried,
        ('UNK') => MaritalStatus.unknown,
        (_) => null,
      };

  JsonValue get json => JsonString(code);

  @override
  int compareTo(MaritalStatus other) => code == other.code ? 0 : 1;
}
