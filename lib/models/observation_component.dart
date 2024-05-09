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
import 'package:jayse/jayse.dart';

/// Represents a single observation component within a larger observation.
class ObservationComponent  {
  /// Constructs a new [ObservationComponent] with various optional measurement values and attributes.
  ObservationComponent({
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
  }) : this.fromJson(
          JsonObject({
            if (code != null) 'code': code.json,
            if (valueQuantity != null) 'valueQuantity': valueQuantity.json,
            if (valueCodeableConcept != null)
              'valueCodeableConcept': valueCodeableConcept.json,
            if (valueString != null) 'valueString': JsonString(valueString),
            if (valueBoolean != null) 'valueBoolean': JsonBoolean(valueBoolean),
            if (valueInteger != null) 'valueInteger': JsonNumber(valueInteger),
            if (valueRange != null) 'valueRange': valueRange.json,
            if (valueRatio != null) 'valueRatio': valueRatio.json,
            if (valueSampledData != null)
              'valueSampledData': valueSampledData.json,
            if (valueTime != null)
              'valueTime': JsonString(valueTime.toString()),
            if (valueDateTime != null)
              'valueDateTime': JsonString(valueDateTime.toIso8601String()),
            if (valuePeriod != null) 'valuePeriod': valuePeriod.json,
            if (dataAbsentReason != null)
              'dataAbsentReason': dataAbsentReason.json,
            if (interpretation != null)
              'interpretation': JsonArray(interpretation.map((e) => e.json)),
            if (referenceRange != null)
              'referenceRange': JsonArray(referenceRange.map((e) => e.json)),
          }),
        );

  /// Constructs a new [ObservationComponent] instance from the provided JSON object.
  ObservationComponent.fromJson(this._json);

  final JsonObject _json;

  /// Converts this [ObservationComponent] instance to a JSON object.
  JsonObject get json => _json;

  /// Returns the code that identifies what was observed.
  CodeableConcept? get code => getCodeableConcept(_json, 'code');

  /// Returns the value of the observation if it's a quantity.
  Quantity? get valueQuantity => getQuantity(_json, 'valueQuantity');

  /// Returns the value of the observation if it's a codeable concept.
  CodeableConcept? get valueCodeableConcept =>
      getCodeableConcept(_json, 'valueCodeableConcept');

  /// Returns the value of the observation if it's a string.
  String? get valueString => _json.getValue('valueString').stringValue;

  /// Returns the value of the observation if it's a boolean.
  bool? get valueBoolean => _json.getValue('valueBoolean').booleanValue;

  /// Returns the value of the observation if it's an integer.
  int? get valueInteger => _json.getValue('valueInteger').numericValue;

  /// Returns the value of the observation if it's a range.
  Range? get valueRange => getRange(_json, 'valueRange');

  /// Returns the value of the observation if it's a ratio.
  Ratio? get valueRatio => getRatio(_json, 'valueRatio');

  /// Returns the value of the observation if it's sampled data.
  SampledData? get valueSampledData =>
      getSampledData(_json, 'valueSampledData');

  /// Returns the value of the observation if it's a time.
  Time? get valueTime => getTime(_json, 'valueTime');

  /// Returns the value of the observation if it's a date-time.
  DateTime? get valueDateTime => _json.getValue('valueDateTime').dateTimeValue;

  /// Returns the value of the observation if it's a period.
  Period? get valuePeriod => getPeriod(_json, 'valuePeriod');

  /// Returns the codeable concept if there's a reason data is absent.
  CodeableConcept? get dataAbsentReason =>
      getCodeableConcept(_json, 'dataAbsentReason');

  /// Returns the interpretation of the observation as a list of codeable concepts.
  FixedList<CodeableConcept>? get interpretation =>
      getFixedListCodeableConcept(_json, 'interpretation');

  /// Returns the reference ranges applicable to this component.
  FixedList<ObservationReferenceRange>? get referenceRange =>
      getFixedListReferenceRange(_json, 'referenceRange');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationComponent && other.json == _json);

  @override
  int get hashCode => _json.hashCode;
}
