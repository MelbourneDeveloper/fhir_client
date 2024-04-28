import 'package:fhir_client/models/quantity.dart';

/// A set of ordered Quantities defined by a low and high limit.
class Range {
  Range({this.low, this.high});

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        low: json['low'] != null
            ? Quantity.fromJson(json['low'] as Map<String, dynamic>)
            : null,
        high: json['high'] != null
            ? Quantity.fromJson(json['high'] as Map<String, dynamic>)
            : null,
      );

  /// The low limit. The boundary is inclusive.
  final Quantity? low;

  /// The high limit. The boundary is inclusive.
  final Quantity? high;

  Map<String, dynamic> toJson() => {
        'low': low?.toJson(),
        'high': high?.toJson(),
      };
}
