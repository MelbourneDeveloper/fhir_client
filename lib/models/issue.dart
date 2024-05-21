import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A single issue associated with the action.
class Issue {

  /// Constructs a new [Issue] with an optional severity, code, and diagnostics.
  Issue({
    String? severity,
    String? code,
    String? diagnostics,
  }) : this.fromJson(
          JsonObject({
            if (severity != null) severityField.name: JsonString(severity),
            if (code != null) codeField.name: JsonString(code),
            if (diagnostics != null)
              diagnosticsField.name: JsonString(diagnostics),
          }),
        );

  /// Constructs a new [Issue] instance from the provided JSON object.
  Issue.fromJson(this._json);

  final JsonObject _json;

  /// Indicates whether the issue indicates a variation from successful 
  /// processing.
  String? get severity => severityField.getValue(_json);

  /// Describes the type of the issue. The system that creates an 
  /// OperationOutcome SHALL choose the most applicable code from the 
  /// IssueType value set, and may additional provide its own code for the 
  /// error in the details element.
  String? get code => codeField.getValue(_json);

  /// Additional diagnostic information about the issue.
  String? get diagnostics => diagnosticsField.getValue(_json);

  /// Field definition for [severity]
  static const severityField = FieldDefinition(
    name: 'severity',
    getValue: _getSeverity,
  );

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [diagnostics]
  static const diagnosticsField = FieldDefinition(
    name: 'diagnostics',
    getValue: _getDiagnostics,
  );

  /// All field definitions for [Issue]
  static const fieldDefinitions = [
    severityField,
    codeField,
    diagnosticsField,
  ];

  static String? _getSeverity(JsonObject jo) =>
      jo.getValue(severityField.name).stringValue;

  static String? _getCode(JsonObject jo) =>
      jo.getValue(codeField.name).stringValue;

  static String? _getDiagnostics(JsonObject jo) =>
      jo.getValue(diagnosticsField.name).stringValue;

  /// Converts this [Issue] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Issue &&
          other.severity == severity &&
          other.code == code &&
          other.diagnostics == diagnostics);

  @override
  int get hashCode => severity.hashCode ^ code.hashCode ^ diagnostics.hashCode;

  /// Makes a deep copy of this [Issue].
  Issue copyWith({
    String? severity,
    String? code,
    String? diagnostics,
  }) =>
      Issue(
        severity: severity ?? this.severity,
        code: code ?? this.code,
        diagnostics: diagnostics ?? this.diagnostics,
      );
}
