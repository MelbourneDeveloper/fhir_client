import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:jayse/jayse.dart';

/// The source of admission for a patient to a healthcare service.
class AdmitSource {
  /// Creates an instance of [AdmitSource].
  AdmitSource({
    CodeableConcept? coding,
    Reference? admitter,
  }) : this.fromJson(
          JsonObject({
            if (coding != null) codingField.name: coding.json,
            if (admitter != null) admitterField.name: admitter.json,
          }),
        );

  /// Creates an instance of [AdmitSource] from a JSON object.
  AdmitSource.fromJson(this._json);

  final JsonObject _json;
  /// Converts the [AdmitSource] instance to a JSON object.
  JsonObject get json => _json;

  /// The coded value for the admit source.
  CodeableConcept? get coding => codingField.getValue(_json);

  /// The reference to the admitting practitioner.
  Reference? get admitter => admitterField.getValue(_json);

  /// Field definition for [coding]
  static const codingField = FieldDefinition(
    name: 'coding',
    getValue: _getCoding,
  );

  /// Field definition for [admitter]
  static const admitterField = FieldDefinition(
    name: 'admitter',
    getValue: _getAdmitter,
  );

  /// All field definitions for [AdmitSource]
  static const fieldDefinitions = [
    codingField,
    admitterField,
  ];

  static CodeableConcept? _getCoding(JsonObject jo) => switch (jo['coding']) {
        (final JsonObject jo) => CodeableConcept.fromJson(jo),
        _ => null,
      };

  static Reference? _getAdmitter(JsonObject jo) => switch (jo['admitter']) {
        (final JsonObject jo) => Reference.fromJson(jo),
        _ => null,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdmitSource &&
          other.coding == coding &&
          other.admitter == admitter);

  @override
  int get hashCode => Object.hash(coding, admitter);

  /// Creates a copy of the [AdmitSource] instance and allows
  /// for non-destructive mutation.
  AdmitSource copyWith({
    CodeableConcept? coding,
    Reference? admitter,
  }) =>
      AdmitSource(
        coding: coding ?? this.coding,
        admitter: admitter ?? this.admitter,
      );
}
