import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/reference.dart';

/// The source of admission for a patient to a healthcare service.
class AdmitSource {
  /// Creates an instance of [AdmitSource].
  AdmitSource({
    this.coding,
    this.admitter,
  });

  /// Creates an instance of [AdmitSource] from a JSON map.
  factory AdmitSource.fromJson(Map<String, dynamic> json) => AdmitSource(
        coding: json['coding'] != null
            ? CodeableConcept.fromJson(json['coding'] as Map<String, dynamic>)
            : null,
        admitter: json['admitter'] != null
            ? Reference.fromJson(json['admitter'] as Map<String, dynamic>)
            : null,
      );

  /// The coded value for the admit source.
  final CodeableConcept? coding;

  /// The reference to the admitting practitioner.
  final Reference? admitter;

  /// Converts this [AdmitSource] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        'coding': coding?.toJson(),
        'admitter': admitter?.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      (identical(this, other)) ||
      other is AdmitSource &&
          other.coding == coding &&
          other.admitter == admitter;

  @override
  int get hashCode => Object.hash(coding, admitter);
}
