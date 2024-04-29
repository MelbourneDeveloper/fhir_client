import 'package:fhir_client/models/basic_types/json_object.dart';

const _codeField = 'code';
const _systemField = 'system';

class Tag extends JsonObject {
  Tag({
    Definable<String> code = const Undefined(),
    Definable<Uri> system = const Undefined(),
  }) : super({
          if (code is Defined<String>) _codeField: code.value,
          if (system is Defined<Uri>) _systemField: system.value,
        });

  Tag.fromJson(super.json);

  Definable<String> get code => getValue(_codeField);
  Definable<Uri> get system =>
      getValueFromString(_systemField, tryParse: (u) => Uri.tryParse(u ?? ''));

  Tag copyWith({
    Definable<String>? code,
    Definable<Uri>? system,
  }) =>
      Tag(
        code: code ?? this.code,
        system: system ?? this.system,
      );
}
