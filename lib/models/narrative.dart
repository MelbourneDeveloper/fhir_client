import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A human-readable summary of the resource conveying the essential clinical
///  and business information for the resource.
class Narrative {
  /// Constructs a new [Narrative]
  Narrative({
    NarrativeStatus? status,
    String? div,
  }) : this.fromJson(
          JsonObject({
            if (status != null) statusField.name: JsonString(status.code),
            if (div != null) divField.name: JsonString(div),
          }),
        );

  /// Constructs a new [Narrative] instance from the provided JSON object.
  Narrative.fromJson(this._json);

  final JsonObject _json;

  /// The status of the narrative - whether it's entirely generated (from just
  ///  the defined data or the extensions too), or whether a human authored it
  /// and it may contain additional data.
  NarrativeStatus? get status => statusField.getValue(_json);

  /// The actual narrative content, a stripped down version of XHTML.
  String? get div => divField.getValue(_json);

  /// Field definition for [status]
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
  );

  /// Field definition for [div]
  static const divField = FieldDefinition(
    name: 'div',
    getValue: _getDiv,
  );

  /// All field definitions for [Narrative]
  static const fieldDefinitions = [
    statusField,
    divField,
  ];

  static NarrativeStatus? _getStatus(JsonObject jo) {
    final value = jo.getValue(statusField.name).stringValue;
    return value != null ? NarrativeStatus.fromCode(value) : null;
  }

  static String? _getDiv(JsonObject jo) =>
      jo.getValue(divField.name).stringValue;

  /// Converts this [Narrative] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Narrative && other.status == status && other.div == div);

  @override
  int get hashCode => status.hashCode ^ div.hashCode;

  /// Makes a deep copy of this [Narrative].
  Narrative copyWith({
    NarrativeStatus? status,
    String? div,
  }) =>
      Narrative(
        status: status ?? this.status,
        div: div ?? this.div,
      );
}

/// Enumeration of possible values for the narrative status.
enum NarrativeStatus {
  generated,
  extensions,
  additional,
  empty;

  /// Creates a [NarrativeStatus] from the provided string code.
  static NarrativeStatus? fromCode(String code) {
    switch (code) {
      case 'generated':
        return NarrativeStatus.generated;
      case 'extensions':
        return NarrativeStatus.extensions;
      case 'additional':
        return NarrativeStatus.additional;
      case 'empty':
        return NarrativeStatus.empty;
      default:
        return null;
    }
  }
}

/// Extension methods for [NarrativeStatus].
extension NarrativeStatusExtensions on NarrativeStatus {
  /// Returns the string code representation of the narrative status.
  String get code {
    switch (this) {
      case NarrativeStatus.generated:
        return 'generated';
      case NarrativeStatus.extensions:
        return 'extensions';
      case NarrativeStatus.additional:
        return 'additional';
      case NarrativeStatus.empty:
        return 'empty';
    }
  }
}
