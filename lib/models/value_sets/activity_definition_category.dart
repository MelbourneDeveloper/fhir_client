// ignore_for_file: lines_longer_than_80_chars
import 'package:jayse/jayse.dart';

/// High-level categorization of the type of activity.
enum ActivityDefinitionCategory
    implements Comparable<ActivityDefinitionCategory> {
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
  final String code;

  /// A human-readable string to display to the user.
  final String display;

  /// Provides a more detailed explanation or description of the concept
  final String definition;

  /// Returns the enum value based on the string code, and returns null if
  /// no match is found
  static ActivityDefinitionCategory? fromCode(String code) => switch (code) {
        ('assessment') => ActivityDefinitionCategory.assessment,
        ('education') => ActivityDefinitionCategory.education,
        ('treatment') => ActivityDefinitionCategory.treatment,
        (_) => null,
      };

  /// Converts the code to a JsonString for the purpose of JSON
  /// serialization
  JsonValue get json => JsonString(code);

  @override
  int compareTo(ActivityDefinitionCategory other) => code == other.code ? 0 : 1;
}
