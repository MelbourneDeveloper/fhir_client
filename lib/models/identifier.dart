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
        system: Uri.tryParse(json['system'] as String? ?? ''),
        value: json['value'] != null ? json['value'] as String? : null,
        use: json['use'] as String?,
      );
  final Type? type;

  //TODO: Uri
  final Uri? system;
  final String? value;
  final String? use;

  Map<String, dynamic> toJson() => {
        'type': type?.toJson(),
        'system': system.toString(),
        'value': value,
        'use': use,
      };
}
