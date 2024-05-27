import 'package:fhir_client/models/basic_types/choice_types.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:jayse/jayse.dart';

/// Represents the FHIR concept of cardinality
class Cardinality {
  /// Creates a new instance of [Cardinality].
  const Cardinality({required this.min, this.max});

  /// Represents a cardinality of 0..1
  static const singular = Cardinality(min: 0);

  /// 0 = not required. 1 = at least one, etc.
  final int min;

  /// True = Star | False = No Max | Int = Max
  final BooleanOrIntegerChoice? max;

  /// Whether or not the data type is a list/array
  bool get isArray => switch (max) {
        (final IntegerChoice value) when value.value > 1 => true,
        (final BoolChoice value) => value.value,
        _ => false
      };

  /// Whether or not the field is required
  bool get isRequired => min > 0;
}

/// A function that validates a field value.
typedef ValidateResource = List<ValidationError> Function(
  JsonValue value, {
  bool isUpdate,
});

/// FHIR specific metadata about the field
class FieldDefinition<T> {
  /// Creates a new instance of [FieldDefinition].
  const FieldDefinition({
    required this.name,
    required this.getValue,
    this.customValidationRules = const [],
    //No min
    this.cardinality = Cardinality.singular,
    this.isSummary = false,
    this.isModifier = false,
    this.isReadOnly = false,
    this.regex,
    this.description,
    this.allowedStringValues = const [],
    this.display,
  });

  /// Returns the value of the field from the provided [JsonObject].
  final T? Function(JsonObject) getValue;

  /// The name of the field.
  final String name;

  /// The display for the UI
  final String? display;

  /// A list of validation rules for the field.
  // ignore: strict_raw_type
  final List<ValidateResource> customValidationRules;

  /// Field Cardinality
  final Cardinality cardinality;

  /// Indicates whether the field is part of the resource summary.
  final bool isSummary;

  /// Indicates whether the field modifies the behavior of the resource.
  final bool isModifier;

  /// Indicates whether the field is read-only.
  final bool isReadOnly;

  /// A regular expression pattern to validate the field value.
  final String? regex;

  /// A description of the field.
  final String? description;

  /// A list of allowed string values.
  final List<String> allowedStringValues;

  /// Validates the field value based on the defined validation rules.
  List<ValidationError> validate(
    JsonValue value, {
    bool isUpdate = false,
  }) {
    final errors = <ValidationError>[];

    if (cardinality.isRequired) {
      //Check for null
      if (value is JsonNull) {
        errors.add(
          ValidationError(
            message: 'Field $name is required, but null was specified',
            field: name,
          ),
        );
      } else {
        if (!isUpdate && value is Undefined) {
          errors.add(
            ValidationError(
              message: 'Field $name is required, but no value was specified',
              field: name,
            ),
          );
        }
      }
    }

    if (_isList(value) && value is! Undefined) {
      if (value is! JsonArray) {
        errors.add(
          ValidationError(
            message: 'Field $name must be an array',
            field: name,
          ),
        );
      } else {
        if (value.length < cardinality.min) {
          errors.add(
            ValidationError(
              message:
                  'Field $name must have at least ${cardinality.min} items',
              field: name,
            ),
          );
        }

        if (cardinality.max is IntegerChoice &&
            value.length > (cardinality.max! as IntegerChoice).value) {
          errors.add(
            ValidationError(
              message: 'Field $name must have at most ${cardinality.max} items',
              field: name,
            ),
          );
        }
      }
    }

    if (regex != null) {
      if (value is! JsonString) {
        if (value.isSome) {
          errors.add(
            ValidationError(
              message: 'Field $name must be a string and '
                  'match the regex expression',
              field: name,
            ),
          );
        }
      } else {
        if (!RegExp(regex!).hasMatch(value.value)) {
          errors.add(
            ValidationError(
              message: 'Field $name must match the pattern $regex',
              field: name,
            ),
          );
        }
      }
    }

    if (allowedStringValues.isNotEmpty) {
      if (_isList(value)) {
        //TODO: validate the list
      } else {
        if (value is! JsonString) {
          if (value.isSome) {
            errors.add(
              ValidationError(
                message: 'Field $name must be a string',
                field: name,
              ),
            );
          }
        } else {
          if (!allowedStringValues.contains(value.value)) {
            errors.add(
              ValidationError(
                message: 'Field $name value must be one of '
                    '[ ${allowedStringValues.join(', ')} ]',
                field: name,
              ),
            );
          }
        }
      }
    }

    return errors;
  }

  bool _isList(JsonValue value) =>
      (cardinality.max is BoolChoice &&
          cardinality.max == const BoolChoice(true)) ||
      (cardinality.max is IntegerChoice &&
          (cardinality.max! as IntegerChoice).value > 1);
}

/// Represents a validation error.
class ValidationError {
  /// Creates a new instance of [ValidationError].
  const ValidationError({
    required this.message,
    required this.field,
  });

  /// The error message.
  final String message;

  /// The field that caused the error.
  final String field;
}

/// Represents the result of a validation.
class ValidationResult {
  /// Creates a new instance of [ValidationResult].
  ValidationResult(this.errorMessages);

  /// Indicates whether the validation result is valid.
  bool get isValid => errorMessages.isEmpty;

  /// A list of validation errors.
  final List<ValidationError> errorMessages;

  @override
  String toString() => 'Is Valid: $isValid\n'
      '${errorMessages.map((e) => '${e.field} - ${e.message}').join('\n')}';
}

/// Validation extension methods for [Resource].
extension ResourceValidationExtensions<T> on Resource {
  /// Validates the resource based on the provided [fieldDefinitions].
  ValidationResult validate(
    // ignore: strict_raw_type
    List<FieldDefinition> fieldDefinitions,
  ) {
    final errorMessages = <ValidationError>[];

    for (final fieldDefinition in fieldDefinitions) {
      final validationResult =
          fieldDefinition.validate(json[fieldDefinition.name]);
      if (validationResult.isNotEmpty) {
        errorMessages.addAll(validationResult);
      }
    }

    final allowedFields = <String>{
      ...fieldDefinitions.map((field) => field.name),
      'resourceType',
      'extension',
    };

    // ignore: unused_local_variable
    final superfluousFields = json.fields
        .toSet()
        .difference(allowedFields)
        .map(
          (name) => name,
        )
        .toList();

    errorMessages.addAll(
      superfluousFields.map(
        (name) => ValidationError(
          message: 'Field $name is not allowed',
          field: name,
        ),
      ),
    );

    return ValidationResult(errorMessages);
  }
}
