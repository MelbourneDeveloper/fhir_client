// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/time.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/observation_reference_range.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/models/range.dart';
import 'package:fhir_client/models/ratio.dart';
import 'package:fhir_client/models/sampled_data.dart';

const _codeField = 'code';
const _valueQuantityField = 'valueQuantity';
const _valueCodeableConceptField = 'valueCodeableConcept';
const _valueStringField = 'valueString';
const _valueBooleanField = 'valueBoolean';
const _valueIntegerField = 'valueInteger';
const _valueRangeField = 'valueRange';
const _valueRatioField = 'valueRatio';
const _valueSampledDataField = 'valueSampledData';
const _valueTimeField = 'valueTime';
const _valueDateTimeField = 'valueDateTime';
const _valuePeriodField = 'valuePeriod';
const _dataAbsentReasonField = 'dataAbsentReason';
const _interpretationField = 'interpretation';
const _referenceRangeField = 'referenceRange';

/// Some observations have multiple component observations.
/// These component observations are expressed as separate code value pairs that share the same attributes.
/// Examples include systolic and diastolic component observations for blood pressure measurement and multiple component observations for genetics observations.
class ObservationComponent extends JsonObject {
  /// Constructs a new [ObservationComponent].
  ObservationComponent({
    Definable<CodeableConcept> code = const Undefined(),
    Definable<Quantity> valueQuantity = const Undefined(),
    Definable<CodeableConcept> valueCodeableConcept = const Undefined(),
    Definable<String> valueString = const Undefined(),
    Definable<bool> valueBoolean = const Undefined(),
    Definable<int> valueInteger = const Undefined(),
    Definable<Range> valueRange = const Undefined(),
    Definable<Ratio> valueRatio = const Undefined(),
    Definable<SampledData> valueSampledData = const Undefined(),
    Definable<Time> valueTime = const Undefined(),
    Definable<DateTime> valueDateTime = const Undefined(),
    Definable<Period> valuePeriod = const Undefined(),
    Definable<CodeableConcept> dataAbsentReason = const Undefined(),
    Definable<FixedList<CodeableConcept>> interpretation = const Undefined(),
    Definable<FixedList<ObservationReferenceRange>> referenceRange =
        const Undefined(),
  }) : super({
          if (code is Defined<CodeableConcept>) _codeField: code.value,
          if (valueQuantity is Defined<Quantity>)
            _valueQuantityField: valueQuantity.value,
          if (valueCodeableConcept is Defined<CodeableConcept>)
            _valueCodeableConceptField: valueCodeableConcept.value,
          if (valueString is Defined<String>)
            _valueStringField: valueString.value,
          if (valueBoolean is Defined<bool>)
            _valueBooleanField: valueBoolean.value,
          if (valueInteger is Defined<int>)
            _valueIntegerField: valueInteger.value,
          if (valueRange is Defined<Range>) _valueRangeField: valueRange.value,
          if (valueRatio is Defined<Ratio>) _valueRatioField: valueRatio.value,
          if (valueSampledData is Defined<SampledData>)
            _valueSampledDataField: valueSampledData.value,
          if (valueTime is Defined<Time>)
            _valueTimeField: valueTime.value.toString(),
          if (valueDateTime is Defined<DateTime>)
            _valueDateTimeField: valueDateTime.value?.toIso8601String(),
          if (valuePeriod is Defined<Period>)
            _valuePeriodField: valuePeriod.value,
          if (dataAbsentReason is Defined<CodeableConcept>)
            _dataAbsentReasonField: dataAbsentReason.value,
          if (interpretation is Defined<FixedList<CodeableConcept>>)
            _interpretationField: interpretation.value,
          if (referenceRange is Defined<FixedList<ObservationReferenceRange>>)
            _referenceRangeField: referenceRange.value,
        });

  /// Constructs a new [ObservationComponent]. This constructor treats nulls as undefined.
  ObservationComponent.primitives({
    CodeableConcept? code,
    Quantity? valueQuantity,
    CodeableConcept? valueCodeableConcept,
    String? valueString,
    bool? valueBoolean,
    int? valueInteger,
    Range? valueRange,
    Ratio? valueRatio,
    SampledData? valueSampledData,
    Time? valueTime,
    DateTime? valueDateTime,
    Period? valuePeriod,
    CodeableConcept? dataAbsentReason,
    FixedList<CodeableConcept>? interpretation,
    FixedList<ObservationReferenceRange>? referenceRange,
  }) : super({
          if (code != null) _codeField: code,
          if (valueQuantity != null) _valueQuantityField: valueQuantity,
          if (valueCodeableConcept != null)
            _valueCodeableConceptField: valueCodeableConcept,
          if (valueString != null) _valueStringField: valueString,
          if (valueBoolean != null) _valueBooleanField: valueBoolean,
          if (valueInteger != null) _valueIntegerField: valueInteger,
          if (valueRange != null) _valueRangeField: valueRange,
          if (valueRatio != null) _valueRatioField: valueRatio,
          if (valueSampledData != null)
            _valueSampledDataField: valueSampledData,
          if (valueTime != null) _valueTimeField: valueTime.toString(),
          if (valueDateTime != null)
            _valueDateTimeField: valueDateTime.toIso8601String(),
          if (valuePeriod != null) _valuePeriodField: valuePeriod,
          if (dataAbsentReason != null)
            _dataAbsentReasonField: dataAbsentReason,
          if (interpretation != null) _interpretationField: interpretation,
          if (referenceRange != null) _referenceRangeField: referenceRange,
        });

  /// Creates an [ObservationComponent] instance from the provided JSON object.
  ObservationComponent.fromJson(super.json);

  /// Describes what was observed. Sometimes this is called the observation "code".
  ///
  /// Type: CodeableConcept
  /// Path: ObservationComponent.code
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get code => getValueFromObjectArray(
        _codeField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Quantity
  /// Path: ObservationComponent.valueQuantity
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Quantity> get valueQuantity => getValueFromObjectArray(
        _valueQuantityField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Quantity.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: CodeableConcept
  /// Path: ObservationComponent.valueCodeableConcept
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get valueCodeableConcept =>
      getValueFromObjectArray(
        _valueCodeableConceptField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: StringType
  /// Path: ObservationComponent.valueString
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get valueString => getValue(_valueStringField);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: BooleanType
  /// Path: ObservationComponent.valueBoolean
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<bool> get valueBoolean => getValue(_valueBooleanField);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: IntegerType
  /// Path: ObservationComponent.valueInteger
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<int> get valueInteger => getValue(_valueIntegerField);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Range
  /// Path: ObservationComponent.valueRange
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Range> get valueRange => getValueFromObjectArray(
        _valueRangeField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Range.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Ratio
  /// Path: ObservationComponent.valueRatio
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Ratio> get valueRatio => getValueFromObjectArray(
        _valueRatioField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Ratio.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: SampledData
  /// Path: ObservationComponent.valueSampledData
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<SampledData> get valueSampledData => getValueFromObjectArray(
        _valueSampledDataField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => SampledData.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: TimeType
  /// Path: ObservationComponent.valueTime
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Time> get valueTime => getValueFromString(
        _valueTimeField,
        tryParse: (t) => Time.tryParse(t ?? ''),
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: DateTimeType
  /// Path: ObservationComponent.valueDateTime
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get valueDateTime => getValueFromString(
        _valueDateTimeField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Period
  /// Path: ObservationComponent.valuePeriod
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Period> get valuePeriod => getValueFromObjectArray(
        _valuePeriodField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// Provides a reason why the expected value in the element Observation.component.value[] is missing.
  ///
  /// Type: CodeableConcept
  /// Path: ObservationComponent.dataAbsentReason
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get dataAbsentReason => getValueFromObjectArray(
        _dataAbsentReasonField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// A categorical assessment of an observation value. This is often used to supply a "normal" range categorization for numeric values.
  ///
  /// Type: List<CodeableConcept>
  /// Path: ObservationComponent.interpretation
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableConcept>> get interpretation =>
      getValueFromObjectArray(
        _interpretationField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// Guidance on how to interpret the value by comparison to a normal or recommended range.
  ///
  /// Type: List<ObservationReferenceRange>
  /// Path: ObservationComponent.referenceRange
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<ObservationReferenceRange>> get referenceRange =>
      getValueFromObjectArray(
        _referenceRangeField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => ObservationReferenceRange.fromJson(
                dm as Map<String, dynamic>,
              ),
            )
            .toFixedList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationComponent &&
          other.code == code &&
          other.valueQuantity == valueQuantity &&
          other.valueCodeableConcept == valueCodeableConcept &&
          other.valueString == valueString &&
          other.valueBoolean == valueBoolean &&
          other.valueInteger == valueInteger &&
          other.valueRange == valueRange &&
          other.valueRatio == valueRatio &&
          other.valueSampledData == valueSampledData &&
          other.valueTime == valueTime &&
          other.valueDateTime == valueDateTime &&
          other.valuePeriod == valuePeriod &&
          other.dataAbsentReason == dataAbsentReason &&
          other.interpretation == interpretation &&
          other.referenceRange == referenceRange);

  @override
  int get hashCode => Object.hash(
        code,
        valueQuantity,
        valueCodeableConcept,
        valueString,
        valueBoolean,
        valueInteger,
        valueRange,
        valueRatio,
        valueSampledData,
        valueTime,
        valueDateTime,
        valuePeriod,
        dataAbsentReason,
        interpretation,
        referenceRange,
      );

  /// Creates a copy of the [ObservationComponent] instance and allows
  /// for non-destructive mutation.
  ObservationComponent copyWith({
    Definable<CodeableConcept>? code,
    Definable<Quantity>? valueQuantity,
    Definable<CodeableConcept>? valueCodeableConcept,
    Definable<String>? valueString,
    Definable<bool>? valueBoolean,
    Definable<int>? valueInteger,
    Definable<Range>? valueRange,
    Definable<Ratio>? valueRatio,
    Definable<SampledData>? valueSampledData,
    Definable<Time>? valueTime,
    Definable<DateTime>? valueDateTime,
    Definable<Period>? valuePeriod,
    Definable<CodeableConcept>? dataAbsentReason,
    Definable<FixedList<CodeableConcept>>? interpretation,
    Definable<FixedList<ObservationReferenceRange>>? referenceRange,
  }) =>
      ObservationComponent(
        code: code ?? this.code,
        valueQuantity: valueQuantity ?? this.valueQuantity,
        valueCodeableConcept: valueCodeableConcept ?? this.valueCodeableConcept,
        valueString: valueString ?? this.valueString,
        valueBoolean: valueBoolean ?? this.valueBoolean,
        valueInteger: valueInteger ?? this.valueInteger,
        valueRange: valueRange ?? this.valueRange,
        valueRatio: valueRatio ?? this.valueRatio,
        valueSampledData: valueSampledData ?? this.valueSampledData,
        valueTime: valueTime ?? this.valueTime,
        valueDateTime: valueDateTime ?? this.valueDateTime,
        valuePeriod: valuePeriod ?? this.valuePeriod,
        dataAbsentReason: dataAbsentReason ?? this.dataAbsentReason,
        interpretation: interpretation ?? this.interpretation,
        referenceRange: referenceRange ?? this.referenceRange,
      );
}
