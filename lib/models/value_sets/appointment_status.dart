// ignore_for_file: lines_longer_than_80_chars

const _appointmentStatusUri = 'http://hl7.org/fhir/appointmentstatus';

/// The free/busy status of an appointment.
enum AppointmentStatus implements Comparable<AppointmentStatus> {
  /// Some or all of the participant(s) have not finalized their acceptance of the appointment request.
  proposed(
    code: 'proposed',
    display: 'Proposed',
    system: _appointmentStatusUri,
  ),

  /// All participant(s) have been considered and the appointment is confirmed to go ahead at the date/times specified.
  booked(
    code: 'booked',
    display: 'Booked',
    system: _appointmentStatusUri,
  ),

  /// Some of the patients have arrived.
  arrived(
    code: 'arrived',
    display: 'Arrived',
    system: _appointmentStatusUri,
  ),

  /// This appointment has completed and may have resulted in an encounter.
  fulfilled(
    code: 'fulfilled',
    display: 'Fulfilled',
    system: _appointmentStatusUri,
  ),

  /// The appointment has been cancelled.
  cancelled(
    code: 'cancelled',
    display: 'Cancelled',
    system: _appointmentStatusUri,
  ),

  /// Some or all of the participant(s) have not/did not appear for the appointment (usually the patient).
  noshow(
    code: 'noshow',
    display: 'No Show',
    system: _appointmentStatusUri,
  ),

  /// This instance should not have been part of this patient's medical record.
  enteredInError(
    code: 'entered-in-error',
    display: 'Entered in error',
    system: _appointmentStatusUri,
  );

  const AppointmentStatus({
    required this.code,
    required this.display,
    required this.system,
  });

  /// A code representing the appointment status.
  ///
  /// The code is a required field that contains a code from the specified terminology system.
  /// It represents the free/busy status of the appointment.
  final String code;

  /// A human-readable display name for the appointment status.
  ///
  /// The display is a required field that contains a short, human-readable label for the appointment status.
  /// It provides a more user-friendly representation of the code.
  final String display;

  /// The URI of the terminology system that defines the appointment status codes.
  ///
  /// The system is a required field that contains the URI of the terminology system or ontology
  /// where the appointment status codes are defined. It helps to identify the specific coding system used.
  final String system;

  /// Returns the appointment status based on the string code, and returns entered-in-error if no match is found
  static AppointmentStatus? fromCode(String code) => switch (code) {
        ('proposed') => AppointmentStatus.proposed,
        ('booked') => AppointmentStatus.booked,
        ('arrived') => AppointmentStatus.arrived,
        ('fulfilled') => AppointmentStatus.fulfilled,
        ('cancelled') => AppointmentStatus.cancelled,
        ('noshow') => AppointmentStatus.noshow,
        ('entered-in-error') => AppointmentStatus.enteredInError,
        _ => null,
      };

  @override
  int compareTo(AppointmentStatus other) => code == other.code ? 0 : 1;
}
