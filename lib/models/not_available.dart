import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/period.dart';
import 'package:jayse/jayse.dart';

/// The practitioner is not available or performing this role during this 
/// period of time due to the provided reason.
class NotAvailable {
  /// Creates an instance of [NotAvailable].
  NotAvailable({
    String? description,
    Period? during,
  }) : this.fromJson(
          JsonObject({
            if (description != null)
              descriptionField.name: JsonString(description),
            if (during != null) duringField.name: during.json,
          }),
        );

  /// Creates an instance of [NotAvailable] from a JSON object.
  NotAvailable.fromJson(this._json);

  final JsonObject _json;

  /// Converts the [NotAvailable] instance to a JSON object.
  JsonObject get json => _json;

  /// The reason that can be presented to the user as to why this time is not 
  /// available.
  String? get description => descriptionField.getValue(_json);

  /// Service is not available (seasonally or for a public holiday) from 
  /// this date.
  Period? get during => duringField.getValue(_json);

  /// Field definition for [description].
  static const descriptionField = FieldDefinition(
    name: 'description',
    getValue: _getDescription,
  );

  /// Field definition for [during].
  static const duringField = FieldDefinition(
    name: 'during',
    getValue: _getDuring,
  );

  /// All field definitions for [NotAvailable].
  static const fieldDefinitions = [
    descriptionField,
    duringField,
  ];

  static String? _getDescription(JsonObject jo) =>
      jo[descriptionField.name].stringValue;

  static Period? _getDuring(JsonObject jo) => switch (jo[duringField.name]) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  /// Creates a copy of the [NotAvailable] instance and allows
  /// for non-destructive mutation.
  NotAvailable copyWith({
    String? description,
    Period? during,
  }) =>
      NotAvailable(
        description: description ?? this.description,
        during: during ?? this.during,
      );
}
