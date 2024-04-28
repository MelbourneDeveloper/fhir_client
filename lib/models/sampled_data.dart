// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/quantity.dart';

/// A series of measurements taken by a device, with upper and lower limits.
/// The limits may be pre-coordinated, or may be defined based on the actual data values,
/// or a combination of both.
class SampledData {
  SampledData({
    this.origin,
    this.period,
    this.factor,
    this.lowerLimit,
    this.upperLimit,
    this.dimensions,
    this.data,
  });

  factory SampledData.fromJson(Map<String, dynamic> json) => SampledData(
        origin: json['origin'] != null
            ? Quantity.fromJson(json['origin'] as Map<String, dynamic>)
            : null,
        period: json['period'] as num?,
        factor: json['factor'] as num?,
        lowerLimit: json['lowerLimit'] as num?,
        upperLimit: json['upperLimit'] as num?,
        dimensions: json['dimensions'] as int?,
        data: json['data'] as String?,
      );

  /// The base quantity that a measured value of zero represents.
  final Quantity? origin;

  /// The length of time between sampling times, measured in milliseconds.
  final num? period;

  /// A correction factor that is applied to the sampled data points before they are added to the origin.
  final num? factor;

  /// The lower limit of detection of the measured points.
  /// This is needed if any of the data points have the value "L" (lower than detection limit).
  final num? lowerLimit;

  /// The upper limit of detection of the measured points.
  /// This is needed if any of the data points have the value "U" (higher than detection limit).
  final num? upperLimit;

  /// The number of sample points at each time point. If this value is greater than one,
  /// then the dimensions will be interlaced - all the sample points for a point in time will be
  /// recorded at once.
  final int? dimensions;

  /// A series of data points which are decimal values separated by a single space (character u20).
  /// The special values "E" (error), "L" (below detection limit) and "U" (above detection limit)
  /// can also be used in place of a decimal value.
  final String? data;

  Map<String, dynamic> toJson() => {
        'origin': origin?.toJson(),
        'period': period,
        'factor': factor,
        'lowerLimit': lowerLimit,
        'upperLimit': upperLimit,
        'dimensions': dimensions,
        'data': data,
      };
}
