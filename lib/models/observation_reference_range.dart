// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/fixed_list.dart';
import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/models/range.dart';

/// Reference range for the observation.
class ObservationReferenceRange {
  ObservationReferenceRange({
    this.low,
    this.high,
    this.type,
    this.appliesTo,
    this.age,
    this.text,
  });

  factory ObservationReferenceRange.fromJson(Map<String, dynamic> json) =>
      ObservationReferenceRange(
        low: json['low'] != null
            ? Quantity.fromJson(json['low'] as Map<String, dynamic>)
            : null,
        high: json['high'] != null
            ? Quantity.fromJson(json['high'] as Map<String, dynamic>)
            : null,
        type: json['type'] != null
            ? CodeableConcept.fromJson(json['type'] as Map<String, dynamic>)
            : null,
        appliesTo: (json['appliesTo'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        age: json['age'] != null
            ? Range.fromJson(json['age'] as Map<String, dynamic>)
            : null,
        text: json['text'] as String?,
      );

  /// The value of the low bound of the reference range.
  /// The low bound of the reference range endpoint is inclusive of the value (e.g. reference range is >=5 - <=9).
  /// If the low bound is omitted, it is assumed to be meaningless (e.g. reference range is <=2.3).
  final Quantity? low;

  /// The value of the high bound of the reference range.
  /// The high bound of the reference range endpoint is inclusive of the value (e.g. reference range is >=5 - <=9).
  /// If the high bound is omitted, it is assumed to be meaningless (e.g. reference range is >= 2.3).
  final Quantity? high;

  /// Codes to indicate the what part of the targeted reference population it applies to.
  /// For example, the normal or therapeutic range.
  final CodeableConcept? type;

  /// Codes to indicate the target population this reference range applies to.
  /// For example, a reference range may be based on the normal population or a particular sex or race.
  final FixedList<CodeableConcept>? appliesTo;

  /// The age at which this reference range is applicable.
  /// This is a neonatal age (e.g. number of weeks at term) if the meaning says so.
  final Range? age;

  /// Text based reference range in an observation which may be used when a quantitative range is not appropriate for an observation.
  /// An example would be a reference value of "Negative" or a list or table of 'normals'.
  final String? text;

  Map<String, dynamic> toJson() => {
        'low': low?.toJson(),
        'high': high?.toJson(),
        'type': type?.toJson(),
        'appliesTo': appliesTo?.map((e) => e.toJson()).toFixedList(),
        'age': age?.toJson(),
        'text': text,
      };
}
