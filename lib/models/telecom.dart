import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/extension.dart';

class Telecom {
  Telecom({
    this.extension,
    this.system,
    this.value,
    this.use,
  });

  factory Telecom.fromJson(Map<String, dynamic> json) => Telecom(
        extension: (json['extension'] as List<dynamic>?)
            ?.map((e) => Extension.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        system: json['system'] != null ? json['system'] as String? : null,
        value: json['value'] != null ? json['value'] as String? : null,
        use: json['use'] != null ? json['use'] as String? : null,
      );

  final FixedList<Extension>? extension;
  final String? system;
  final String? value;
  final String? use;

  Map<String, dynamic> toJson() => {
        'extension': extension?.map((e) => e.toJson()).toList(),
        'system': system,
        'value': value,
        'use': use,
      };
}
