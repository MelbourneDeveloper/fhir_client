import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// A human-readable formatted text, including images.
class Text {
  /// Constructs a new [Text] with optional status and div.
  Text({
    String? status,
    String? div,
  }) : this.fromJson(
          JsonObject({
            if (status != null) statusField.name: JsonString(status),
            if (div != null) divField.name: JsonString(div),
          }),
        );

  /// Constructs a new [Text] instance from the provided JSON object.
  Text.fromJson(this._json);

  final JsonObject _json;

  /// The status of the narrative - whether it's entirely generated (from just 
  /// the defined data or the extensions too), or whether a human authored it 
  /// and it may contain additional data.
  String? get status => statusField.getValue(_json);

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

  /// All field definitions for [Text]
  static const fieldDefinitions = [
    statusField,
    divField,
  ];

  static String? _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name).stringValue;

  static String? _getDiv(JsonObject jo) =>
      jo.getValue(divField.name).stringValue;

  /// Converts this [Text] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Text && other.status == status && other.div == div);

  @override
  int get hashCode => status.hashCode ^ div.hashCode;

  /// Creates a deep copy of this [Text].
  Text copyWith({
    String? status,
    String? div,
  }) =>
      Text(
        status: status ?? this.status,
        div: div ?? this.div,
      );
}
