// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/json_object.dart';
import 'package:fhir_client/models/tag.dart';

const _lastUpdatedField = 'lastUpdated';
const _versionIdField = 'versionId';
const _sourceField = 'source';
const _tagField = 'tag';

/// The metadata about a resource. This is content in the resource that is maintained by the
/// infrastructure. Changes to the content might not always be associated with version
/// changes to the resource.
class Meta extends JsonObject {
  /// Constructs a new `Meta` instance from the provided JSON object.
  Meta.fromJson(super.json);

  /// When the resource last changed - e.g. when the version changed.
  ///
  /// Type: DateTimeType
  /// Path: Meta.lastUpdated
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get lastUpdated => getValueFromString(
        _lastUpdatedField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  /// The version specific identifier.
  ///
  /// Type: IdType
  /// Path: Meta.versionId
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get versionId => getValue(_versionIdField);

  /// Identifies where the resource comes from.
  ///
  /// Type: UriType
  /// Path: Meta.source
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get source => getValue(_sourceField);

  /// A list of profiles (references to StructureDefinition resources) that this resource
  /// claims to conform to. The URL is a reference to StructureDefinition.url.
  ///
  /// Type: List<CanonicalType>
  /// Path: Meta.profile
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<String>> get profile => getValueFromArray(
        'profile',
        (strings) => strings?.map((e) => e as String).toFixedList(),
      );

  /// Tags applied to this resource. Tags are intended to be used to identify and relate
  /// resources to process and workflow, and applications are not required to consider the
  /// tags when interpreting the meaning of a resource.
  ///
  /// Type: List<Coding>
  /// Path: Meta.tag
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Tag>> get tag => getValueFromObjectArray(
        _tagField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Tag.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );
}
