// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/json_object.dart';

const _codeField = 'code';
const _systemField = 'system';

/// A coding that represents a tag on a resource.
///
/// Tags are used to relate resources to process and workflow. Applications are not
/// required to consider the tags when interpreting the meaning of a resource.
class Tag extends JsonObject {
  /// Constructs a new [Tag]
  Tag({
    Definable<String> code = const Undefined(),
    Definable<Uri> system = const Undefined(),
  }) : super({
          if (code is Defined<String>) _codeField: code.value,
          if (system is Defined<Uri>) _systemField: system.value,
        });

  /// Constructs a new [Tag] instance from the provided JSON object.
  Tag.fromJson(super.json);

  /// The machine-readable value of the tag.
  ///
  /// Type: CodeType
  /// Path: Tag.code
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<String> get code => getValue(_codeField);

  /// The system that defines the meaning of the tag.
  ///
  /// Type: UriType
  /// Path: Tag.system
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<Uri> get system =>
      getValueFromString(_systemField, tryParse: (u) => Uri.tryParse(u ?? ''));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag && other.code == code && other.system == system);

  @override
  int get hashCode => Object.hash(code, system);

  /// Makes a copy of the [Tag] for non-destructive mutation.
  Tag copyWith({
    Definable<String>? code,
    Definable<Uri>? system,
  }) =>
      Tag(
        code: code ?? this.code,
        system: system ?? this.system,
      );
}
