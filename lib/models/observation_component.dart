// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/fixed_list.dart';
import 'package:fhir_client/models/observation_reference_range.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/models/range.dart';
import 'package:fhir_client/models/ratio.dart';
import 'package:fhir_client/models/sampled_data.dart';
import 'package:fhir_client/models/time.dart';

/// Some observations have multiple component observations.
/// These component observations are expressed as separate code value pairs that share the same attributes.
/// Examples include systolic and diastolic component observations for blood pressure measurement and multiple component observations for genetics observations.
class ObservationComponent {
  ObservationComponent({
    this.code,
    this.valueQuantity,
    this.valueCodeableConcept,
    this.valueString,
    this.valueBoolean,
    this.valueInteger,
    this.valueRange,
    this.valueRatio,
    this.valueSampledData,
    this.valueTime,
    this.valueDateTime,
    this.valuePeriod,
    this.dataAbsentReason,
    this.interpretation,
    this.referenceRange,
  });

  factory ObservationComponent.fromJson(Map<String, dynamic> json) =>
      ObservationComponent(
        code: json['code'] != null
            ? CodeableConcept.fromJson(json['code'] as Map<String, dynamic>)
            : null,
        valueQuantity: json['valueQuantity'] != null
            ? Quantity.fromJson(json['valueQuantity'] as Map<String, dynamic>)
            : null,
        valueCodeableConcept: json['valueCodeableConcept'] != null
            ? CodeableConcept.fromJson(
                json['valueCodeableConcept'] as Map<String, dynamic>,
              )
            : null,
        valueString: json['valueString'] as String?,
        valueBoolean: json['valueBoolean'] as bool?,
        valueInteger: json['valueInteger'] as int?,
        valueRange: json['valueRange'] != null
            ? Range.fromJson(json['valueRange'] as Map<String, dynamic>)
            : null,
        valueRatio: json['valueRatio'] != null
            ? Ratio.fromJson(json['valueRatio'] as Map<String, dynamic>)
            : null,
        valueSampledData: json['valueSampledData'] != null
            ? SampledData.fromJson(
                json['valueSampledData'] as Map<String, dynamic>,
              )
            : null,
        valueTime: json['valueTime'] != null
            ? Time.fromJson(json['valueTime'] as Map<String, dynamic>)
            : null,
        valueDateTime: json['valueDateTime'] != null
            ? DateTime.parse(json['valueDateTime'] as String)
            : null,
        valuePeriod: json['valuePeriod'] != null
            ? Period.fromJson(json['valuePeriod'] as Map<String, dynamic>)
            : null,
        dataAbsentReason: json['dataAbsentReason'] != null
            ? CodeableConcept.fromJson(
                json['dataAbsentReason'] as Map<String, dynamic>,
              )
            : null,
        interpretation: (json['interpretation'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        referenceRange: (json['referenceRange'] as List<dynamic>?)
            ?.map(
              (e) =>
                  ObservationReferenceRange.fromJson(e as Map<String, dynamic>),
            )
            .toFixedList(),
      );

  /// Describes what was observed. Sometimes this is called the observation "code".
  final CodeableConcept? code;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final Quantity? valueQuantity;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final CodeableConcept? valueCodeableConcept;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final String? valueString;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final bool? valueBoolean;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final int? valueInteger;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final Range? valueRange;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final Ratio? valueRatio;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final SampledData? valueSampledData;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final Time? valueTime;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final DateTime? valueDateTime;

  /// The information determined as a result of making the observation,
  /// if the information has a simple value.
  final Period? valuePeriod;

  /// Provides a reason why the expected value in the element Observation.component.value[] is missing.
  final CodeableConcept? dataAbsentReason;

  /// A categorical assessment of an observation value.
  /// This is often used to supply a "normal" range categorization for numeric values.
  final FixedList<CodeableConcept>? interpretation;

  /// Guidance on how to interpret the value by comparison to a normal or recommended range.
  final FixedList<ObservationReferenceRange>? referenceRange;

  Map<String, dynamic> toJson() => {
        'code': code?.toJson(),
        'valueQuantity': valueQuantity?.toJson(),
        'valueCodeableConcept': valueCodeableConcept?.toJson(),
        'valueString': valueString,
        'valueBoolean': valueBoolean,
        'valueInteger': valueInteger,
        'valueRange': valueRange?.toJson(),
        'valueRatio': valueRatio?.toJson(),
        'valueSampledData': valueSampledData?.toJson(),
        'valueTime': valueTime?.toJson(),
        'valueDateTime': valueDateTime?.toIso8601String(),
        'valuePeriod': valuePeriod?.toJson(),
        'dataAbsentReason': dataAbsentReason?.toJson(),
        'interpretation': interpretation?.map((e) => e.toJson()).toFixedList(),
        'referenceRange': referenceRange?.map((e) => e.toJson()).toFixedList(),
      };
}
