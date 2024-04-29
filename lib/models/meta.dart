import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/json_object.dart';
import 'package:fhir_client/models/tag.dart';

const _lastUpdatedField = 'lastUpdated';
const _versionIdField = 'versionId';
const _sourceField = 'source';

class Meta extends JsonObject {
  // Meta({
  //   this.lastUpdated,
  //   this.versionId,
  //   this.source,
  //   this.profile,
  //   this.tag,
  // });

  Meta.fromJson(super.json);

  Definable<DateTime> get lastUpdated => getValue(
        _lastUpdatedField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );
  Definable<String> get versionId => getValue(_versionIdField);
  Definable<String> get source => getValue(_sourceField);
  Definable<FixedList<String>> get profile => getValueFromArray(
        'profile',
        (strings) => strings?.map((e) => e as String).toFixedList(),
      );
  Definable<FixedList<Tag>> get tag => getValue(
        'tag',
        fromObjectArray: (jsonTags) =>
            jsonTags?.map(Tag.fromJson).toFixedList(),
      );
}
