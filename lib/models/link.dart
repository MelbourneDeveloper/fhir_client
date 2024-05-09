import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Represents a hyperlink from the containing resource to a URI.
class Link {
  /// Constructs a new [Link] with an optional relation type and URL.
  Link({
    String? relation,
    Uri? url,
  }) : this.fromJson(
          JsonObject({
            if (relation != null) relationField.name: JsonString(relation),
            if (url != null) urlField.name: JsonString(url.toString()),
          }),
        );

  /// Constructs a new [Link] instance from the provided JSON object.
  Link.fromJson(this._json);

  final JsonObject _json;

  /// The type of relationship this link represents (e.g., 'next', 'previous').
  String? get relation => relationField.getValue(_json);

  /// The URL that this link points to.
  Uri? get url => urlField.getValue(_json);

  /// Field definition for [relation]
  static const relationField = FieldDefinition(
    name: 'relation',
    getValue: _getRelation,
  );

  /// Field definition for [url]
  static const urlField = FieldDefinition(
    name: 'url',
    getValue: _getUrl,
  );

  /// All field definitions for [Link]
  static const fieldDefinitions = [
    relationField,
    urlField,
  ];

  static String? _getRelation(JsonObject jo) =>
      jo.getValue(relationField.name).stringValue;

  static Uri? _getUrl(JsonObject jo) {
    final value = jo.getValue(urlField.name).stringValue;
    return value != null ? Uri.parse(value) : null;
  }

  /// Converts this [Link] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Link && other.relation == relation && other.url == url);

  @override
  int get hashCode => Object.hash(relation, url);
}
