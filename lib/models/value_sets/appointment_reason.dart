// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

/// Code system of concepts used to describe the kind of appointment or the reason why an appointment has been scheduled.  Used in HL7 Version 2.x messaging in the ARQ segment.
enum AppointmentReason with ValueSetConcept<AppointmentReason> {
  /// A routine check-up, such as an annual physical
  CHECKUP(
    code: 'CHECKUP',
    display: 'A routine check-up, such as an annual physical',
    definition: 'A routine check-up, such as an annual physical',
  ),

  /// Emergency appointment
  EMERGENCY(
    code: 'EMERGENCY',
    display: 'Emergency appointment',
    definition: 'Emergency appointment',
  ),

  /// A follow up visit from a previous appointment
  FOLLOWUP(
    code: 'FOLLOWUP',
    display: 'A follow up visit from a previous appointment',
    definition: 'A follow up visit from a previous appointment',
  ),

  /// Routine appointment - default if not valued
  ROUTINE(
    code: 'ROUTINE',
    display: 'Routine appointment - default if not valued',
    definition: 'Routine appointment - default if not valued',
  ),

  /// A previously unscheduled walk-in visit
  WALKIN(
    code: 'WALKIN',
    display: 'A previously unscheduled walk-in visit',
    definition: 'A previously unscheduled walk-in visit',
  );

  const AppointmentReason({
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
  static AppointmentReason? fromCode(String code) => switch (code) {
        ('CHECKUP') => AppointmentReason.CHECKUP,
        ('EMERGENCY') => AppointmentReason.EMERGENCY,
        ('FOLLOWUP') => AppointmentReason.FOLLOWUP,
        ('ROUTINE') => AppointmentReason.ROUTINE,
        ('WALKIN') => AppointmentReason.WALKIN,
        (_) => null,
      };
}
