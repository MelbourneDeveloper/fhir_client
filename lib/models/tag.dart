import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A coding that represents a tag on a resource.
///
/// Tags are used to relate resources to process and workflow. Applications are 
/// not required to consider the tags when interpreting the meaning of a 
/// resource.
class Tag {
  /// Constructs a new [Tag]
  Tag({
    String? code,
    Uri? system,
  }) : this.fromJson(
          JsonObject({
            if (code != null) codeField.name: JsonString(code),
            if (system != null) systemField.name: JsonString(system.toString()),
          }),
        );

  /// Constructs a new [Tag] instance from the provided JSON object.
  Tag.fromJson(this._json);

  final JsonObject _json;

  /// The machine-readable value of the tag.
  ///
  /// Type: CodeType
  /// Path: Tag.code
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  String? get code => codeField.getValue(_json);

  /// The system that defines the meaning of the tag.
  ///
  /// Type: UriType
  /// Path: Tag.system
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Uri? get system =>
      Uri.tryParse(_json.getValue(systemField.name).stringValue ?? '');

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [system]
  static const systemField = FieldDefinition(
    name: 'system',
    getValue: _getSystem,
  );

  /// All field definitions for [Tag]
  static const fieldDefinitions = [
    codeField,
    systemField,
  ];

  static String? _getCode(JsonObject jo) =>
      jo.getValue(codeField.name).stringValue;

  static Uri? _getSystem(JsonObject jo) =>
      Uri.tryParse(jo.getValue(systemField.name).stringValue ?? '');

  /// Converts this [Tag] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag && other.code == code && other.system == system);

  @override
  int get hashCode => Object.hash(code, system);

  /// Makes a copy of the [Tag] for non-destructive mutation.
  Tag copyWith({
    String? code,
    Uri? system,
  }) =>
      Tag(
        code: code ?? this.code,
        system: system ?? this.system,
      );
}
