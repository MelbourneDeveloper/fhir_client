import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/reference.dart';

class AdmitSource {
  AdmitSource({
    this.coding,
    this.admitter,
  });

  factory AdmitSource.fromJson(Map<String, dynamic> json) => AdmitSource(
        coding: json['coding'] != null
            ? CodeableConcept.fromJson(json['coding'] as Map<String, dynamic>)
            : null,
        admitter: json['admitter'] != null
            ? Reference.fromJson(json['admitter'] as Map<String, dynamic>)
            : null,
      );
      
  final CodeableConcept? coding;
  final Reference? admitter;

  Map<String, dynamic> toJson() => {
        'coding': coding?.toJson(),
        'admitter': admitter?.toJson(),
      };
}
