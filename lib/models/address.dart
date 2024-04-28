// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/fixed_list.dart';

/// An address expressed using postal conventions (as opposed to GPS or other location definition formats). This datatype may be used to convey addresses for use in delivering mail as well as for visiting locations which might not be valid for mail delivery. There are a variety of postal address formats defined around the world.
/// https://hl7.org/fhir/datatypes.html#Address
class Address {
  /// Creates an Address
  Address({
    this.use,
    this.type,
    this.line,
    this.city,
    this.district,
    this.state,
    this.postalCode,
    this.country,
  });

  /// Creates an Address from the JSON data
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        use: json['use'] != null ? json['use'] as String? : null,
        type: json['type'] != null ? json['type'] as String? : null,
        line: (json['line'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toFixedList(),
        city: json['city'] != null ? json['city'] as String? : null,
        district: json['district'] != null ? json['district'] as String? : null,
        state: json['state'] != null ? json['state'] as String? : null,
        postalCode:
            json['postalCode'] != null ? json['postalCode'] as String? : null,
        country: json['country'] != null ? json['country'] as String? : null,
      );

  /// home | work | temp | old | billing - purpose of this address
  final String? use;

  /// postal | physical | both
  final String? type;

  /// Street name, number, direction & P.O. Box etc. This repeating element order: The order in which lines should appear in an address label
  final FixedList<String>? line;

  /// Name of city, town etc.
  final String? city;

  /// District name (aka county)
  final String? district;

  /// Sub-unit of country (abbreviations ok)
  final String? state;

  /// Postal code for area
  final String? postalCode;

  /// Country (e.g. may be ISO 3166 2 or 3 letter code)
  final String? country;

  /// Converts an Address instance to JSON data
  Map<String, dynamic> toJson() => {
        'use': use,
        'type': type,
        'line': line?.toList(),
        'city': city,
        'district': district,
        'state': state,
        'postalCode': postalCode,
        'country': country,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.use == use &&
        other.type == type &&
        other.line == line &&
        other.city == city &&
        other.district == district &&
        other.state == state &&
        other.postalCode == postalCode &&
        other.country == country;
  }

  @override
  int get hashCode =>
      use.hashCode ^
      type.hashCode ^
      line.hashCode ^
      city.hashCode ^
      district.hashCode ^
      state.hashCode ^
      postalCode.hashCode ^
      country.hashCode;
}
