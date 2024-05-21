import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/tag.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// The metadata about a resource. This is content in the resource that is
/// maintained by the infrastructure. Changes to the content might not always
/// be associated with version changes to the resource.
class Meta {
  /// Constructs a new `Meta` with an optional last updated date, version ID
  Meta({
    DateTime? lastUpdated,
    String? versionId,
    String? source,
    FixedList<String>? profile,
    FixedList<Tag>? tag,
  }) : this.fromJson(
          JsonObject({
            if (lastUpdated != null)
              lastUpdatedField.name: JsonString(lastUpdated.toIso8601String()),
            if (versionId != null) versionIdField.name: JsonString(versionId),
            if (source != null) sourceField.name: JsonString(source),
            if (profile != null)
              profileField.name: JsonArray.unmodifiable(
                profile.map(JsonString.new),
              ),
            if (tag != null)
              tagField.name: JsonArray.unmodifiable(
                tag.map((e) => e.json),
              ),
          }),
        );

  /// Constructs a new `Meta` instance from the provided JSON object.
  Meta.fromJson(this._json);

  final JsonObject _json;

  /// When the resource last changed - e.g. when the version changed.
  DateTime? get lastUpdated => lastUpdatedField.getValue(_json);

  /// The version specific identifier.
  String? get versionId => versionIdField.getValue(_json);

  /// Identifies where the resource comes from.
  String? get source => sourceField.getValue(_json);

  //TODO: Should be URIs

  /// A list of profiles (references to StructureDefinition resources) that
  /// this resource claims to conform to. The URL is a reference to
  /// StructureDefinition.url.
  FixedList<String>? get profile => profileField.getValue(_json);

  /// Tags applied to this resource. Tags are intended to be used to identify
  /// and relate resources to process and workflow, and applications are
  /// not required to consider the tags when interpreting the meaning of a
  /// resource.
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
        (final JsonArray jsonArray)
          // TODO: Reassess how to handle this
            when jsonArray.value.every((jv) => jv is JsonString) =>
          FixedList(jsonArray.value.cast<JsonString>().map((js) => js.value)),
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

  /// Makes a deep copy of this `Meta` instance.
  Meta copyWith({
    DateTime? lastUpdated,
    String? versionId,
    String? source,
    FixedList<String>? profile,
    FixedList<Tag>? tag,
  }) =>
      Meta(
        lastUpdated: lastUpdated ?? this.lastUpdated,
        versionId: versionId ?? this.versionId,
        source: source ?? this.source,
        profile: profile ?? this.profile,
        tag: tag ?? this.tag,
      );
}
