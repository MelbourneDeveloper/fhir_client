import 'package:fhir_client/models/type.dart';

class Identifier {
  Identifier({
    this.type,
    this.system,
    this.value,
    this.use,
  });

  factory Identifier.fromJson(Map<String, dynamic> json) => Identifier(
        type: json['type'] != null
            ? Type.fromJson(json['type'] as Map<String, dynamic>)
            : null,
        system: json['system'] != null ? json['system'] as String? : null,
        value: json['value'] != null ? json['value'] as String? : null,
        use: json['use'] as String?,
      );
  final Type? type;
  final String? system;
  final String? value;
  final String? use;

  Map<String, dynamic> toJson() => {
        'type': type?.toJson(),
        'system': system,
        'value': value,
        'use': use,
      };
}
