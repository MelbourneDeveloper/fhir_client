import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/jayse_extensions.dart';
import 'package:jayse/jayse.dart';

/// Represents an extension that may modify the interpretation of the
/// resource or element that contains it.
class Extension {
  /// Constructs a new [Extension] with an optional URL, nested extensions, 
  /// and a boolean value.
  Extension({
    Uri? url,
    FixedList<Extension>? extension,
    bool? valueBoolean,
  }) : this.fromJson(
          JsonObject({
            if (url != null) urlField.name: JsonString(url.toString()),
            if (extension != null)
              extensionField.name:
                  JsonArray(extension.map((e) => e.json).toList()),
            if (valueBoolean != null)
              valueBooleanField.name: JsonBoolean(valueBoolean),
          }),
        );

  /// Constructs a new [Extension] instance from the provided JSON object.
  Extension.fromJson(this._json);

  final JsonObject _json;

  /// The URL that identifies the meaning of the extension.
  Uri? get url => urlField.getValue(_json);

  /// Nested extensions providing additional information.
  FixedList<Extension>? get extension => extensionField.getValue(_json);

  /// The boolean value for the extension.
  bool? get valueBoolean => valueBooleanField.getValue(_json);

  /// Field definition for [url]
  static const urlField = FieldDefinition(
    name: 'url',
    getValue: _getUrl,
  );

  /// Field definition for [extension]
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
  );

  /// Field definition for [valueBoolean]
  static const valueBooleanField = FieldDefinition(
    name: 'valueBoolean',
    getValue: _getValueBoolean,
  );

  /// All field definitions for [Extension]
  static const fieldDefinitions = [
    urlField,
    extensionField,
    valueBooleanField,
  ];

  static Uri? _getUrl(JsonObject jo) {
    final value = jo.getValue(urlField.name).stringValue;
    return value != null ? Uri.parse(value) : null;
  }

  static FixedList<Extension>? _getExtension(JsonObject jo) =>
      switch (jo['extension']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getValueBoolean(JsonObject jo) =>
      jo.getValue(valueBooleanField.name).booleanValue;

  /// Converts this [Extension] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Extension &&
          other.url == url &&
          other.extension == extension &&
          other.valueBoolean == valueBoolean);

  @override
  int get hashCode => Object.hash(url, extension, valueBoolean);
}
