// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/search.dart';
import 'package:jayse/jayse.dart';

/// An entry in a bundle resource - will either contain a resource or information about a resource (transactions and history only).
class Entry {
  /// Creates a new [Entry] instance.
  Entry({
    Uri? fullUrl,
    Resource? resource,
    Search? search,
  }) : this.fromJson(
          JsonObject({
            if (fullUrl != null)
              fullUrlField.name: JsonString(fullUrl.toString()),
            if (resource != null) resourceField.name: resource.json,
            if (search != null) searchField.name: search.json,
          }),
        );

  /// Creates a new [Entry] instance from the provided JSON object.
  Entry.fromJson(this._json);

  final JsonObject _json;

  /// The Absolute URL for the resource. This must be provided for all resources in a bundle
  /// if an absolute URL is needed (e.g. for signatures).
  /// The fullUrl SHALL not disagree with the id in the resource - i.e. if the fullUrl is not
  /// a urn:uuid, the URL shall be version-independent URL consistent with the Resource.id.
  Uri? get fullUrl => fullUrlField.getValue(_json);

  /// The Resources for the entry.
  Resource? get resource => resourceField.getValue(_json);

  /// Information about the search process that lead to the creation of this entry.
  Search? get search => searchField.getValue(_json);

  /// Field definition for [fullUrl]
  static const fullUrlField = FieldDefinition(
    name: 'fullUrl',
    getValue: _getFullUrl,
  );

  /// Field definition for [resource]
  static const resourceField = FieldDefinition(
    name: 'resource',
    getValue: _getResource,
  );

  /// Field definition for [search]
  static const searchField = FieldDefinition(
    name: 'search',
    getValue: _getSearch,
  );

  /// All field definitions for [Entry]
  static const fieldDefinitions = [
    fullUrlField,
    resourceField,
    searchField,
  ];

  static Uri? _getFullUrl(JsonObject jo) {
    final value = jo.getValue(fullUrlField.name).stringValue;
    return value != null ? Uri.parse(value) : null;
  }

  static Resource? _getResource(JsonObject jo) => switch (jo['resource']) {
        (final JsonObject jsonObject) => Resource(jsonObject),
        _ => null,
      };

  static Search? _getSearch(JsonObject jo) => switch (jo['search']) {
        (final JsonObject jsonObject) => Search.fromJson(jsonObject),
        _ => null,
      };

  /// Converts this [Entry] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          other.fullUrl == fullUrl &&
          other.resource == resource &&
          other.search == search);

  @override
  int get hashCode => fullUrl.hashCode ^ resource.hashCode ^ search.hashCode;

  /// Creates a copy of this [Entry] but with the given fields replaced with the new values.
  Entry copyWith({
    Uri? fullUrl,
    Resource? resource,
    Search? search,
  }) =>
      Entry(
        fullUrl: fullUrl ?? this.fullUrl,
        resource: resource ?? this.resource,
        search: search ?? this.search,
      );
}
