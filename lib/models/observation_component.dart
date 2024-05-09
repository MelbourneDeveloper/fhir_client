// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/jayse_extensions.dart';
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
class ObservationComponent {
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
              'interpretation':
                  JsonArray(interpretation.map((e) => e.json).toList()),
            if (referenceRange != null)
              'referenceRange':
                  JsonArray(referenceRange.map((e) => e.json).toList()),
          }),
        );

  /// Constructs a new [ObservationComponent] instance from the provided JSON object.
  ObservationComponent.fromJson(this._json);

  final JsonObject _json;

  /// Converts this [ObservationComponent] instance to a JSON object.
  JsonObject get json => _json;

  /// Returns the code that identifies what was observed.
  CodeableConcept? get code => _getCodeableConcept(_json, 'code');

  CodeableConcept? _getCodeableConcept(JsonObject jo, String key) =>
      switch (jo[key]) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  /// Returns the value of the observation if it's a quantity.
  Quantity? get valueQuantity => _getQuantity(_json, 'valueQuantity');

  Quantity? _getQuantity(JsonObject jo, String key) => switch (jo[key]) {
        (final JsonObject jsonObject) => Quantity.fromJson(jsonObject),
        _ => null,
      };

  /// Returns the value of the observation if it's a codeable concept.
  CodeableConcept? get valueCodeableConcept =>
      _getCodeableConcept(_json, 'valueCodeableConcept');

  /// Returns the value of the observation if it's a string.
  String? get valueString => _json.getValue('valueString').stringValue;

  /// Returns the value of the observation if it's a boolean.
  bool? get valueBoolean => _json.getValue('valueBoolean').booleanValue;

  /// Returns the value of the observation if it's an integer.
  int? get valueInteger => _json.getValue('valueInteger').integerValue;

  /// Returns the value of the observation if it's a range.
  Range? get valueRange => _getRange(_json, 'valueRange');

  Range? _getRange(JsonObject jo, String key) => switch (jo[key]) {
        (final JsonObject jsonObject) => Range.fromJson(jsonObject),
        _ => null,
      };

  /// Returns the value of the observation if it's a ratio.
  Ratio? get valueRatio => _getRatio(_json, 'valueRatio');

  Ratio? _getRatio(JsonObject jo, String key) => switch (jo[key]) {
        (final JsonObject jsonObject) => Ratio.fromJson(jsonObject),
        _ => null,
      };

  /// Returns the value of the observation if it's sampled data.
  SampledData? get valueSampledData =>
      _getSampledData(_json, 'valueSampledData');

  SampledData? _getSampledData(JsonObject jo, String key) => switch (jo[key]) {
        (final JsonObject jsonObject) => SampledData.fromJson(jsonObject),
        _ => null,
      };

  /// Returns the value of the observation if it's a time.
  Time? get valueTime => _getTime(_json, 'valueTime');
  Time? _getTime(JsonObject jo, String key) =>
      Time.tryParse(jo.getValue(key).stringValue ?? '');

  /// Returns the value of the observation if it's a date-time.
  DateTime? get valueDateTime => _json.getValue('valueDateTime').dateTimeValue;

  /// Returns the value of the observation if it's a period.
  Period? get valuePeriod => _getPeriod(_json, 'valuePeriod');
  Period? _getPeriod(JsonObject jo, String key) => switch (jo[key]) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  /// Returns the codeable concept if there's a reason data is absent.
  CodeableConcept? get dataAbsentReason =>
      _getCodeableConcept(_json, 'dataAbsentReason');

  /// Returns the interpretation of the observation as a list of codeable concepts.
  FixedList<CodeableConcept>? get interpretation =>
      _getFixedListCodeableConcept(_json, 'interpretation');

  FixedList<CodeableConcept>? _getFixedListCodeableConcept(
    JsonObject jo,
    String key,
  ) =>
      switch (jo[key]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  /// Returns the reference ranges applicable to this component.
  FixedList<ObservationReferenceRange>? get referenceRange =>
      _getFixedListReferenceRange(_json, 'referenceRange');

  FixedList<ObservationReferenceRange>? _getFixedListReferenceRange(
    JsonObject json,
    String fieldName,
  ) =>
      switch (json[fieldName]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map(
              (e) => ObservationReferenceRange.fromJson(e as JsonObject),
            ),
          ),
        _ => null,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationComponent && other.json == _json);

  @override
  int get hashCode => _json.hashCode;
}
