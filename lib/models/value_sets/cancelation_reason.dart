// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

/// The coded reason for the appointment being canceled.
enum CancelationReason with ValueSetConcept<CancelationReason> {
  /// The patient has cancelled the appointment.
  patientCancel(
    code: 'pat',
    display: 'Patient',
    definition: 'The patient has cancelled the appointment.',
  ),

  /// The practitioner has cancelled the appointment.
  practitionerCancel(
    code: 'prac',
    display: 'Practitioner',
    definition: 'The practitioner has cancelled the appointment.',
  ),

  /// The location/system has cancelled the appointment.
  locationCancel(
    code: 'loc',
    display: 'Location',
    definition: 'The location/system has cancelled the appointment.',
  ),

  /// The appointment has been cancelled by the organization.
  organizationCancel(
    code: 'org',
    display: 'Organization',
    definition: 'The appointment has been cancelled by the organization.',
  ),

  /// The appointment has been cancelled and will be rebooked or rescheduled.
  rebookCancel(
    code: 'maint',
    display: 'Maintenance',
    definition:
        'The appointment has been cancelled and will be rebooked or rescheduled.',
  ),

  /// The appointment has been cancelled as the patient did not show up.
  noShowCancel(
    code: 'nosh',
    display: 'No Show',
    definition:
        'The appointment has been cancelled as the patient did not show up.',
  );

  const CancelationReason({
    required this.code,
    required this.display,
    required this.definition,
  });

  @override
  final String code;

  @override
  final String display;

  @override
  final String definition;

  /// Returns the cancelation reason based on the string code, and returns null if
  /// no match is found
  static CancelationReason? fromCode(String code) => switch (code) {
        ('pat') => CancelationReason.patientCancel,
        ('prac') => CancelationReason.practitionerCancel,
        ('loc') => CancelationReason.locationCancel,
        ('org') => CancelationReason.organizationCancel,
        ('maint') => CancelationReason.rebookCancel,
        ('nosh') => CancelationReason.noShowCancel,
        (_) => null,
      };
}
