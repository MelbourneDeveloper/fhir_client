import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A series of measurements taken by a device, with upper and lower limits.
/// The limits may be pre-coordinated, or may be defined based on the
/// actual data values, or a combination of both.
class SampledData {
  /// Constructs a new [SampledData] with details about sampling.
  SampledData({
    Quantity? origin,
    num? period,
    num? factor,
    num? lowerLimit,
    num? upperLimit,
    int? dimensions,
    String? data,
  }) : this.fromJson(
          JsonObject({
            if (origin != null) originField.name: origin.json,
            if (period != null) periodField.name: JsonNumber(period),
            if (factor != null) factorField.name: JsonNumber(factor),
            if (lowerLimit != null)
              lowerLimitField.name: JsonNumber(lowerLimit),
            if (upperLimit != null)
              upperLimitField.name: JsonNumber(upperLimit),
            if (dimensions != null)
              dimensionsField.name: JsonNumber(dimensions),
            if (data != null) dataField.name: JsonString(data),
          }),
        );

  /// Constructs a new [SampledData] instance from the provided JSON object.
  SampledData.fromJson(this._json);

  final JsonObject _json;

  /// The base quantity that a measured value of zero represents.
  Quantity? get origin => originField.getValue(_json);

  /// The length of time between sampling times, measured in milliseconds.
  num? get period => periodField.getValue(_json);

  /// A correction factor that is applied to the sampled data points before
  /// they are added to the origin.
  num? get factor => factorField.getValue(_json);

  /// The lower limit of detection of the measured points.
  num? get lowerLimit => lowerLimitField.getValue(_json);

  /// The upper limit of detection of the measured points.
  num? get upperLimit => upperLimitField.getValue(_json);

  /// The number of sample points at each time point.
  int? get dimensions => dimensionsField.getValue(_json);

  /// A series of data points.
  String? get data => dataField.getValue(_json);

  /// Field definition for [origin]
  static const originField = FieldDefinition(
    name: 'origin',
    getValue: _getOrigin,
  );

  /// Field definition for [period]
  static const periodField = FieldDefinition(
    name: 'period',
    getValue: _getPeriod,
  );

  /// Field definition for [factor]
  static const factorField = FieldDefinition(
    name: 'factor',
    getValue: _getFactor,
  );

  /// Field definition for [lowerLimit]
  static const lowerLimitField = FieldDefinition(
    name: 'lowerLimit',
    getValue: _getLowerLimit,
  );

  /// Field definition for [upperLimit]
  static const upperLimitField = FieldDefinition(
    name: 'upperLimit',
    getValue: _getUpperLimit,
  );

  /// Field definition for [dimensions]
  static const dimensionsField = FieldDefinition(
    name: 'dimensions',
    getValue: _getDimensions,
  );

  /// Field definition for [data]
  static const dataField = FieldDefinition(
    name: 'data',
    getValue: _getData,
  );

  /// All field definitions for [SampledData]
  static const fieldDefinitions = [
    originField,
    periodField,
    factorField,
    lowerLimitField,
    upperLimitField,
    dimensionsField,
    dataField,
  ];

  static Quantity? _getOrigin(JsonObject jo) => switch (jo['origin']) {
        (final JsonObject jo) => Quantity.fromJson(jo),
        _ => null,
      };

  static num? _getPeriod(JsonObject jo) =>
      jo.getValue(periodField.name).numericValue;

  static num? _getFactor(JsonObject jo) =>
      jo.getValue(factorField.name).numericValue;

  static num? _getLowerLimit(JsonObject jo) =>
      jo.getValue(lowerLimitField.name).numericValue;

  static num? _getUpperLimit(JsonObject jo) =>
      jo.getValue(upperLimitField.name).numericValue;

  static int? _getDimensions(JsonObject jo) =>
      switch (jo.getValue(dimensionsField.name).numericValue) {
        (final int i) => i,
        _ => null
      };

  static String? _getData(JsonObject jo) =>
      jo.getValue(dataField.name).stringValue;

  /// Converts this [SampledData] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SampledData &&
          other.origin == origin &&
          other.period == period &&
          other.factor == factor &&
          other.lowerLimit == lowerLimit &&
          other.upperLimit == upperLimit &&
          other.dimensions == dimensions &&
          other.data == data);

  @override
  int get hashCode => Object.hash(
        origin,
        period,
        factor,
        lowerLimit,
        upperLimit,
        dimensions,
        data,
      );

  /// Create a deep copy of this [SampledData] instance.
  SampledData copyWith({
    Quantity? origin,
    num? period,
    num? factor,
    num? lowerLimit,
    num? upperLimit,
    int? dimensions,
    String? data,
  }) =>
      SampledData(
        origin: origin ?? this.origin,
        period: period ?? this.period,
        factor: factor ?? this.factor,
        lowerLimit: lowerLimit ?? this.lowerLimit,
        upperLimit: upperLimit ?? this.upperLimit,
        dimensions: dimensions ?? this.dimensions,
        data: data ?? this.data,
      );
}
