import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/tag.dart';
import 'package:jayse/jayse.dart';

/// The metadata about a resource. This is content in the resource that is 
/// maintained by the infrastructure. Changes to the content might not always 
/// be associated with version changes to the resource.
class Meta {
  /// Constructs a new `Meta` instance from the provided JSON object.
  Meta.fromJson(this._json);

  final JsonObject _json;

  /// When the resource last changed - e.g. when the version changed.
  ///
  /// Type: DateTimeType
  /// Path: Meta.lastUpdated
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  DateTime? get lastUpdated => lastUpdatedField.getValue(_json);

  /// The version specific identifier.
  ///
  /// Type: IdType
  /// Path: Meta.versionId
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get versionId => versionIdField.getValue(_json);

  /// Identifies where the resource comes from.
  ///
  /// Type: UriType
  /// Path: Meta.source
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  String? get source => sourceField.getValue(_json);

  /// A list of profiles (references to StructureDefinition resources) that 
  /// this resource claims to conform to. The URL is a reference to 
  /// StructureDefinition.url.
  ///
  /// Type: List<CanonicalType>
  /// Path: Meta.profile
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<String>? get profile => profileField.getValue(_json);

  /// Tags applied to this resource. Tags are intended to be used to identify 
  /// and relate resources to process and workflow, and applications are 
  /// not required to consider the tags when interpreting the meaning of a 
  /// resource.
  ///
  /// Type: List<Coding>
  /// Path: Meta.tag
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  FixedList<Tag>? get tag => tagField.getValue(_json);

  /// Field definition for [lastUpdated]
  static const lastUpdatedField = FieldDefinition(
    name: 'lastUpdated',
    getValue: _getLastUpdated,
  );

  /// Field definition for [versionId]
  static const versionIdField = FieldDefinition(
    name: 'versionId',
    getValue: _getVersionId,
  );

  /// Field definition for [source]
  static const sourceField = FieldDefinition(
    name: 'source',
    getValue: _getSource,
  );

  /// Field definition for [profile]
  static const profileField = FieldDefinition(
    name: 'profile',
    getValue: _getProfile,
  );

  /// Field definition for [tag]
  static const tagField = FieldDefinition(
    name: 'tag',
    getValue: _getTag,
  );

  /// All field definitions for [Meta]
  static const fieldDefinitions = [
    lastUpdatedField,
    versionIdField,
    sourceField,
    profileField,
    tagField,
  ];

  static DateTime? _getLastUpdated(JsonObject jo) =>
      DateTime.tryParse(jo.getValue(lastUpdatedField.name).stringValue ?? '');

  static String? _getVersionId(JsonObject jo) =>
      jo.getValue(versionIdField.name).stringValue;

  static String? _getSource(JsonObject jo) =>
      jo.getValue(sourceField.name).stringValue;

  static FixedList<String>? _getProfile(JsonObject jo) =>
      switch (jo['profile']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.whereType<String>()),
        _ => null,
      };

  static FixedList<Tag>? _getTag(JsonObject jo) => switch (jo['tag']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.map((e) => Tag.fromJson(e as JsonObject))),
        _ => null,
      };

  /// Converts this [Meta] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meta &&
          other.lastUpdated == lastUpdated &&
          other.versionId == versionId &&
          other.source == source &&
          other.profile == profile &&
          other.tag == tag);

  @override
  int get hashCode =>
      lastUpdated.hashCode ^
      versionId.hashCode ^
      source.hashCode ^
      profile.hashCode ^
      tag.hashCode;
}
