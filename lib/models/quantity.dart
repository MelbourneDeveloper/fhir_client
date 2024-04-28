// ignore_for_file: lines_longer_than_80_chars

/// A measured amount (or an amount that can potentially be measured).
/// Note that measured amounts include amounts that are not precisely quantified,
/// including amounts involving arbitrary units and floating currencies.
class Quantity {
  Quantity({
    this.value,
    this.unit,
    this.system,
    this.code,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        value: json['value'] as num?,
        unit: json['unit'] as String?,
        system: json['system'] as String?,
        code: json['code'] as String?,
      );

  /// The value of the measured amount. The value includes an implicit precision in the presentation of the value.
  final num? value;

  /// A human-readable form of the unit.
  final String? unit;

  /// The identification of the system that provides the coded form of the unit.
  final String? system;

  /// A computer processable form of the unit in some unit representation system.
  final String? code;

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
        'system': system,
        'code': code,
      };
}
