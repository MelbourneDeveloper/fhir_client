import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A reference to a code defined by a terminology system.
class Coding {

  /// Creates a new [Coding] instance.
  Coding({
    Uri? system,
    String? code,
    String? display,
  }) : this.fromJson(
          JsonObject({
            if (system != null) systemField.name: JsonString(system.toString()),
            if (code != null) codeField.name: JsonString(code),
            if (display != null) displayField.name: JsonString(display),
          }),
        );

  /// Creates a new [Coding] instance from a [JsonObject].
  Coding.fromJson(this._json);

  /// The underlying JSON object for this instance.
  JsonObject get json => _json;

  final JsonObject _json;

  /// The identification of the code system that defines the meaning of the
  /// symbol in the code.
  Uri? get system =>
      Uri.tryParse(_json.getValue(systemField.name).stringValue ?? '');

  /// A symbol in syntax defined by the system. The symbol may be a predefined
  /// code or an expression in a syntax defined by the coding system
  /// (e.g. post-coordination).
  String? get code => _json.getValue(codeField.name).stringValue;

  /// A representation of the meaning of the code in the system, following the
  /// rules of the system.
  String? get display => _json.getValue(displayField.name).stringValue;

  /// Field definition for [system]
  static const systemField = FieldDefinition(
    name: 'system',
    getValue: _getSystem,
  );

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [display]
  static const displayField = FieldDefinition(
    name: 'display',
    getValue: _getDisplay,
  );

  /// All field definitions for [Coding]
  static const fieldDefinitions = [
    systemField,
    codeField,
    displayField,
  ];

  static Uri? _getSystem(JsonObject jo) =>
      Uri.tryParse(jo.getValue(systemField.name).stringValue ?? '');

  static String? _getCode(JsonObject jo) =>
      jo.getValue(codeField.name).stringValue;

  static String? _getDisplay(JsonObject jo) =>
      jo.getValue(displayField.name).stringValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Coding &&
          other.system == system &&
          other.code == code &&
          other.display == display);

  @override
  int get hashCode => Object.hash(system, code, display);

  /// Creates a new [Coding] instance with the provided values.
  Coding copyWith({
    Uri? system,
    String? code,
    String? display,
  }) =>
      Coding(
        system: system ?? this.system,
        code: code ?? this.code,
        display: display ?? this.display,
      );
}
