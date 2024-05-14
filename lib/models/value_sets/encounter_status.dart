const _encounterStatusUri = 'http://hl7.org/fhir/encounter-status';

enum EncounterStatus implements Comparable<EncounterStatus> {
  planned(
    code: 'planned',
    display: 'Planned',
    system: _encounterStatusUri,
  ),
  arrived(
    code: 'arrived',
    display: 'Arrived',
    system: _encounterStatusUri,
  ),
  triaged(
    code: 'triaged',
    display: 'Triaged',
    system: _encounterStatusUri,
  ),
  inProgress(
    code: 'in-progress',
    display: 'In Progress',
    system: _encounterStatusUri,
  ),
  onleave(
    code: 'onleave',
    display: 'On Leave',
    system: _encounterStatusUri,
  ),
  finished(
    code: 'finished',
    display: 'Finished',
    system: _encounterStatusUri,
  ),
  cancelled(
    code: 'cancelled',
    display: 'Cancelled',
    system: _encounterStatusUri,
  ),
  enteredInError(
    code: 'entered-in-error',
    display: 'Entered in Error',
    system: _encounterStatusUri,
  ),
  unknown(
    code: 'unknown',
    display: 'Unknown',
    system: _encounterStatusUri,
  );

  const EncounterStatus({
    required this.code,
    required this.display,
    required this.system,
  });

  final String code;
  final String display;
  final String system;

  static EncounterStatus? fromCode(String code) => switch (code) {
        ('planned') => EncounterStatus.planned,
        ('arrived') => EncounterStatus.arrived,
        ('triaged') => EncounterStatus.triaged,
        ('in-progress') => EncounterStatus.inProgress,
        ('onleave') => EncounterStatus.onleave,
        ('finished') => EncounterStatus.finished,
        ('cancelled') => EncounterStatus.cancelled,
        ('entered-in-error') => EncounterStatus.enteredInError,
        ('unknown') => EncounterStatus.unknown,
        _ => null,
      };

  @override
  int compareTo(EncounterStatus other) => code.compareTo(other.code);
}
