// ignore_for_file: lines_longer_than_80_chars

const _participantStatusUri = 'http://hl7.org/fhir/participationstatus';

/// The Participation status of an appointment.
enum ParticipationStatus implements Comparable<ParticipationStatus> {
  /// The participant has accepted the appointment.
  accepted(
    code: 'accepted',
    display: 'Accepted',
    system: _participantStatusUri,
  ),

  /// The participant has declined the appointment and will not participate in the appointment.
  declined(
    code: 'declined',
    display: 'Declined',
    system: _participantStatusUri,
  ),

  /// The participant has tentatively accepted the appointment. This could be automatically created by a system and requires further processing before it can be accepted. There is no commitment that attendance will occur.
  tentative(
    code: 'tentative',
    display: 'Tentative',
    system: _participantStatusUri,
  ),

  /// The participant needs to indicate if they accept the appointment by changing this status to one of the other statuses.
  needsAction(
    code: 'needs-action',
    display: 'Needs Action',
    system: _participantStatusUri,
  );

  const ParticipationStatus({
    required this.code,
    required this.display,
    required this.system,
  });

  /// A code representing the participation status.
  ///
  /// The code is a required field that contains a code from the specified terminology system.
  /// It represents the participation status of the appointment.
  final String code;

  /// A human-readable display name for the participation status.
  ///
  /// The display is a required field that contains a short, human-readable label for the participation status.
  /// It provides a more user-friendly representation of the code.
  final String display;

  /// The URI of the terminology system that defines the participation status codes.
  ///
  /// The system is a required field that contains the URI of the terminology system or ontology
  /// where the participation status codes are defined. It helps to identify the specific coding system used.
  final String system;

  /// Returns the participation status based on the string code, and throws an exception if no match is found.
  static ParticipationStatus fromCode(String code) => switch (code) {
        ('accepted') => ParticipationStatus.accepted,
        ('declined') => ParticipationStatus.declined,
        ('tentative') => ParticipationStatus.tentative,
        ('needs-action') => ParticipationStatus.needsAction,
        _ => throw Exception('Unknown ParticipationStatus code $code'),
      };

  @override
  int compareTo(ParticipationStatus other) => code == other.code ? 0 : 1;
}
