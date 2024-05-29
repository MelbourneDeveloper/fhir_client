import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Information about the search process that lead to the creation of this
/// entry.
class Search {
  /// Creates an instance of [Search].
  Search({
    String? mode,
  }) : this.fromJson(
          JsonObject({
            if (mode != null) modeField.name: JsonString(mode),
          }),
        );

  /// Creates an instance of [Search] from a JSON object.
  Search.fromJson(this._json);

  final JsonObject _json;

  /// Why this entry is in the result set - whether it's included as a match
  /// or because of an _include requirement, or to convey information or
  /// warning information about the search process.
  String? get mode => modeField.getValue(_json);

  /// Field definition for [mode]
  static const modeField = FieldDefinition(
    name: 'mode',
    getValue: _getMode,
  );

  /// All field definitions for [Search]
  static const fieldDefinitions = [
    modeField,
  ];

  static String? _getMode(JsonObject jo) =>
      jo.getValue(modeField.name).stringValue;

  /// Converts this [Search] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Search && other.mode == mode);

  @override
  int get hashCode => mode.hashCode;

  /// Makes a deep copy of this [Search] instance.
  Search copy({
    String? mode,
  }) =>
      Search(
        mode: mode ?? this.mode,
      );
}
