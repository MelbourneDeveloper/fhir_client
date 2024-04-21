// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Address {
  final String? use;
  final String? type;
  final List<String>? line;
  final String? city;
  final String? district;
  final String? state;
  final String? postalCode;
  final String? country;

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

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      use: json['use'] != null ? json['use'] as String? : null,
      type: json['type'] != null ? json['type'] as String? : null,
      line: (json['line'] as List<dynamic>?)?.map((e) => e as String).toList(),
      city: json['city'] != null ? json['city'] as String? : null,
      district: json['district'] != null ? json['district'] as String? : null,
      state: json['state'] != null ? json['state'] as String? : null,
      postalCode:
          json['postalCode'] != null ? json['postalCode'] as String? : null,
      country: json['country'] != null ? json['country'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'use': use,
      'type': type,
      'line': line?.toList(),
      'city': city,
      'district': district,
      'state': state,
      'postalCode': postalCode,
      'country': country,
    };
  }
}
