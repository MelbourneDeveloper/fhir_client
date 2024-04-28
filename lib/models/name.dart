import 'package:fhir_client/models/basic_types/fixed_list.dart';

class Name {
  Name({
    this.family,
    this.use,
    this.given,
    this.prefix,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        family: json['family'] != null ? json['family'] as String? : null,
        use: json['use'] as String?,
        given: (json['given'] as List<dynamic>?)?.cast<String>().toFixedList(),
        prefix:
            (json['prefix'] as List<dynamic>?)?.cast<String>().toFixedList(),
      );

  final String? family;
  //TODO: enum
  final String? use;
  final FixedList<String>? given;
  final FixedList<String>? prefix;

  Map<String, dynamic> toJson() => {
        'family': family,
        'use': use,
        'given': given?.cast<dynamic>().toList(),
        'prefix': prefix?.cast<dynamic>().toList(),
      };
}
