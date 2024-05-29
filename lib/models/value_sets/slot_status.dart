// ignore_for_file: lines_longer_than_80_chars

const _slotStatusUri = 'http://hl7.org/fhir/slotstatus';

/// The free/busy status of the slot.
enum SlotStatus implements Comparable<SlotStatus> {
  /// Indicates that the time interval is busy because one or more events have been scheduled for that interval.
  busy(
    code: 'busy',
    display: 'Busy',
    system: _slotStatusUri,
  ),

  /// Indicates that the time interval is free for scheduling.
  free(
    code: 'free',
    display: 'Free',
    system: _slotStatusUri,
  ),

  /// Indicates that the time interval is busy and that the interval cannot be scheduled.
  busyUnavailable(
    code: 'busy-unavailable',
    display: 'Busy (Unavailable)',
    system: _slotStatusUri,
  ),

  /// Indicates that the time interval is busy because one or more events have been tentatively scheduled for that interval.
  busyTentative(
    code: 'busy-tentative',
    display: 'Busy (Tentative)',
    system: _slotStatusUri,
  ),

  /// This instance should not have been part of this patient's medical record.
  enteredInError(
    code: 'entered-in-error',
    display: 'Entered in error',
    system: _slotStatusUri,
  );

  const SlotStatus({
    required this.code,
    required this.display,
    required this.system,
  });

  /// A code representing the slot status.
  ///
  /// The code is a required field that contains a code from the specified terminology system.
  /// It represents the free/busy status of the slot.
  final String code;

  /// A human-readable display name for the slot status.
  ///
  /// The display is a required field that contains a short, human-readable label for the slot status.
  /// It provides a more user-friendly representation of the code.
  final String display;

  /// The URI of the terminology system that defines the slot status codes.
  ///
  /// The system is a required field that contains the URI of the terminology system or ontology
  /// where the slot status codes are defined. It helps to identify the specific coding system used.
  final String system;

  /// Returns the slot status based on the string code, and returns entered-in-error if no match is found
  static SlotStatus fromCode(String code) => switch (code) {
        ('busy') => SlotStatus.busy,
        ('free') => SlotStatus.free,
        ('busy-unavailable') => SlotStatus.busyUnavailable,
        ('busy-tentative') => SlotStatus.busyTentative,
        ('entered-in-error') => SlotStatus.enteredInError,
        _ => throw Exception('Unknown SlotStatus code $code'),
      };

  @override
  int compareTo(SlotStatus other) => code == other.code ? 0 : 1;
}
