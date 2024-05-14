import 'package:fhir_client/models/resource.dart';
import 'package:jayse/jayse.dart';

/// FHIR specific metadata about the field
class FieldDefinition<T> {
  const FieldDefinition({
    required this.name,
    required this.getValue,
    this.validationRules = const [],
    this.isRequired = false,
    this.isSummary = false,
    this.isModifier = false,
    this.isReadOnly = false,
    this.min,
    this.max,
    this.regex,
    this.description,
    this.allowedValues,
  });

  /// Returns the value of the field from the provided [JsonObject].
  final T? Function(JsonObject) getValue;

  /// The name of the field.
  final String name;

  /// A list of validation rules for the field.
  // ignore: strict_raw_type
  final List<ValidationRule> validationRules;

  /// Indicates whether the field is required.
  final bool isRequired;

  /// Indicates whether the field is part of the resource summary.
  final bool isSummary;

  /// Indicates whether the field modifies the behavior of the resource.
  final bool isModifier;

  /// Indicates whether the field is read-only.
  final bool isReadOnly;

  /// The minimum cardinality of the field.
  final int? min;

  /// The maximum cardinality of the field.
  final int? max;

  /// A regular expression pattern to validate the field value.
  final String? regex;

  /// A description of the field.
  final String? description;

  final List<Object>? allowedValues;

  MapEntry<String, dynamic> toMapEntry(JsonValue definable) =>
      MapEntry(name, definable);

  /// Validates the field value based on the defined validation rules.
  List<ValidationError> validate(T? value) {
    final errors = <ValidationError>[];

    if (isRequired && value == null) {
      errors.add(
        ValidationError(
          message: 'Field $name is required',
          field: name,
        ),
      );
    }

    if (min != null && value is List && value.length < min!) {
      errors.add(
        ValidationError(
          message: 'Field $name must have at least $min items',
          field: name,
        ),
      );
    }

    if (max != null && value is List && value.length > max!) {
      errors.add(
        ValidationError(
          message: 'Field $name must have at most $max items',
          field: name,
        ),
      );
    }

    if (regex != null && value is String && !RegExp(regex!).hasMatch(value)) {
      errors.add(
        ValidationError(
          message: 'Field $name must match the pattern $regex',
          field: name,
        ),
      );
    }

    return errors;
  }
}

/// A validation rule for a field.
sealed class ValidationRule<T> {
  const ValidationRule();

  /// Validates the field value.
  void validate(T? value);
}

/// A validation rule that checks if the field value is one of the
/// allowed values.
class AllowedValuesRule<T> extends ValidationRule<T> {
  const AllowedValuesRule(this.allowedValues);

  /// The list of allowed values for the field.
  final List<T> allowedValues;

  @override
  void validate(T? value) {
    if (value != null && !allowedValues.contains(value)) {
      throw Exception('Field value must be one of $allowedValues');
    }
  }
}

/// A validation rule that checks if the field value satisfies a
/// custom condition.
class CustomRule<T> extends ValidationRule<T> {
  const CustomRule(this.condition, this.errorMessage);

  /// The custom validation condition.
  final bool Function(T? value) condition;
  final String? errorMessage;

  @override
  void validate(T? value) {
    if (!condition(value)) {
      throw Exception('Field value does not satisfy the custom condition');
    }
  }
}

class ValidationError {
  const ValidationError({
    required this.message,
    required this.field,
  });
  final String message;
  final String field;
}

class ValidationResult {
  ValidationResult(this.errorMessages);
  bool get isValid => errorMessages.isEmpty;
  final List<ValidationError> errorMessages;
}

ValidationResult validate<T extends Resource>(
  // ignore: strict_raw_type
  List<FieldDefinition> fieldDefinitions,
  T resource,
) {
  final errorMessages = <ValidationError>[];

  for (final fieldDefinition in fieldDefinitions) {
    final value = fieldDefinition.getValue(resource.json);
    final validationResult = fieldDefinition.validate(value);
    if (validationResult.isNotEmpty) {
      errorMessages.addAll(validationResult);
    }
  }

  final allowedFields = fieldDefinitions.map((field) => field.name).toSet();
  resource.json.fields.toSet().difference(allowedFields).map(
        (name) => errorMessages.add(
          ValidationError(
            message: 'Field $name is not allowed',
            field: name,
          ),
        ),
      );

  return ValidationResult(errorMessages);
}
