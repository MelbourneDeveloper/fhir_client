// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/quantity.dart';

/// A relationship of two Quantity values - expressed as a numerator and a denominator.
class Ratio {
  Ratio({this.numerator, this.denominator});

  factory Ratio.fromJson(Map<String, dynamic> json) => Ratio(
        numerator: json['numerator'] != null
            ? Quantity.fromJson(json['numerator'] as Map<String, dynamic>)
            : null,
        denominator: json['denominator'] != null
            ? Quantity.fromJson(json['denominator'] as Map<String, dynamic>)
            : null,
      );

  /// The value of the numerator.
  final Quantity? numerator;

  /// The value of the denominator.
  final Quantity? denominator;

  Map<String, dynamic> toJson() => {
        'numerator': numerator?.toJson(),
        'denominator': denominator?.toJson(),
      };
}
