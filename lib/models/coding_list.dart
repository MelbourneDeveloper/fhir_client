import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/codeable_reference.dart';
import 'package:fhir_client/models/coding.dart';

/// This is not an FHIR resource. It's just a common
/// interface that [CodeableReference] and [CodeableConcept]
/// share
abstract interface class CodingList {
  List<Coding>? get coding;
  String? get text;
}
