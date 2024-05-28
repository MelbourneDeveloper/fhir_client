// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

/// High-level categorization of the type of activity.
enum ActivityDefinitionCategory
    with ValueSetConcept<ActivityDefinitionCategory> {
  /// The activity is intended to perform or is related to assessment of the patient.
  assessment(
    code: 'assessment',
    display: 'Assessment',
    definition:
        'The activity is intended to perform or is related to assessment of the patient.',
  ),

  /// The activity is intended to provide or is related to education of the patient.
  education(
    code: 'education',
    display: 'Education',
    definition:
        'The activity is intended to provide or is related to education of the patient.',
  ),

  /// The activity is intended to provide or is related to treatment of the patient.
  treatment(
    code: 'treatment',
    display: 'Treatment',
    definition:
        'The activity is intended to provide or is related to treatment of the patient.',
  );

  const ActivityDefinitionCategory({
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
  static ActivityDefinitionCategory? fromCode(String code) => switch (code) {
        ('assessment') => ActivityDefinitionCategory.assessment,
        ('education') => ActivityDefinitionCategory.education,
        ('treatment') => ActivityDefinitionCategory.treatment,
        (_) => null,
      };
}
