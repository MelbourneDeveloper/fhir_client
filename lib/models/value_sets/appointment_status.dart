// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

/// The free/busy status of an appointment.
enum AppointmentStatus with ValueSetConcept<AppointmentStatus> {
  /// Some or all of the participant(s) have not finalized their acceptance of the appointment request.
  proposed(
    code: 'proposed',
    display: 'Proposed',
    definition: '',
  ),

  /// All participant(s) have been considered and the appointment is confirmed to go ahead at the date/times specified.
  booked(
    code: 'booked',
    display: 'Booked',
    definition: '',
  ),

  /// Some of the patients have arrived.
  arrived(
    code: 'arrived',
    display: 'Arrived',
    definition: '',
  ),

  /// This appointment has completed and may have resulted in an encounter.
  fulfilled(
    code: 'fulfilled',
    display: 'Fulfilled',
    definition: '',
  ),

  /// The appointment has been cancelled.
  cancelled(
    code: 'cancelled',
    display: 'Cancelled',
    definition: '',
  ),

  /// Some or all of the participant(s) have not/did not appear for the appointment (usually the patient).
  noshow(
    code: 'noshow',
    display: 'No Show',
    definition: '',
  ),

  /// This instance should not have been part of this patient's medical record.
  enteredInError(
    code: 'entered-in-error',
    display: 'Entered in error',
    definition: '',
  );

  const AppointmentStatus({
    required this.code,
    required this.display,
    required this.definition,
  });

  /// A code representing the appointment status.
  ///
  /// The code is a required field that contains a code from the specified terminology system.
  /// It represents the free/busy status of the appointment.
  @override
  final String code;

  /// A human-readable display name for the appointment status.
  ///
  /// The display is a required field that contains a short, human-readable label for the appointment status.
  /// It provides a more user-friendly representation of the code.
  @override
  final String display;

  @override
  final String definition;

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
