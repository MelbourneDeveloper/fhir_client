import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/codeable_reference.dart';
import 'package:fhir_client/models/coding.dart';

/// This is not an FHIR resource. It's just a common
/// interface that [CodeableReference] and [CodeableConcept]
/// share
abstract interface class CodingList {

  /// A reference to a code defined by a terminology system.
  List<Coding>? get coding;

  /// A human language representation of the concept as seen/selected/uttered by the user
  String? get text;
}
