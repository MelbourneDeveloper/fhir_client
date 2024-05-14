import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:jayse/jayse.dart';

/// Content in a format defined elsewhere.
class Attachment {
  /// Creates an instance of [Attachment].
  Attachment({
    String? contentType,
    String? language,
    String? data,
    String? url,
    String? size,
    String? hash,
    String? title,
    String? creation,
  }) : this.fromJson(
          JsonObject({
            if (contentType != null)
              contentTypeField.name: JsonString(contentType),
            if (language != null) languageField.name: JsonString(language),
            if (data != null) dataField.name: JsonString(data),
            if (url != null) urlField.name: JsonString(url),
            if (size != null) sizeField.name: JsonString(size),
            if (hash != null) hashField.name: JsonString(hash),
            if (title != null) titleField.name: JsonString(title),
            if (creation != null) creationField.name: JsonString(creation),
          }),
        );

  /// Creates an instance of [Attachment] from a JSON object.
  Attachment.fromJson(this._json);

  final JsonObject _json;

  /// Converts the [Attachment] instance to a JSON object.
  JsonObject get json => _json;

  /// Mime type of the content, with charset etc.
  String? get contentType => contentTypeField.getValue(_json);

  /// Human language of the content (BCP-47).
  String? get language => languageField.getValue(_json);

  /// Data inline, base64ed.
  String? get data => dataField.getValue(_json);

  /// Uri where the data can be found.
  String? get url => urlField.getValue(_json);

  /// Number of bytes of content (if url provided).
  String? get size => sizeField.getValue(_json);

  /// Hash of the data (sha-1, base64ed).
  String? get hash => hashField.getValue(_json);

  /// Label to display in place of the data.
  String? get title => titleField.getValue(_json);

  /// Date attachment was first created.
  String? get creation => creationField.getValue(_json);

  /// Field definition for [contentType].
  static const contentTypeField = FieldDefinition(
    name: 'contentType',
    getValue: _getContentType,
  );

  /// Field definition for [language].
  static const languageField = FieldDefinition(
    name: 'language',
    getValue: _getLanguage,
  );

  /// Field definition for [data].
  static const dataField = FieldDefinition(
    name: 'data',
    getValue: _getData,
  );

  /// Field definition for [url].
  static const urlField = FieldDefinition(
    name: 'url',
    getValue: _getUrl,
  );

  /// Field definition for [size].
  static const sizeField = FieldDefinition(
    name: 'size',
    getValue: _getSize,
  );

  /// Field definition for [hash].
  static const hashField = FieldDefinition(
    name: 'hash',
    getValue: _getHash,
  );

  /// Field definition for [title].
  static const titleField = FieldDefinition(
    name: 'title',
    getValue: _getTitle,
  );

  /// Field definition for [creation].
  static const creationField = FieldDefinition(
    name: 'creation',
    getValue: _getCreation,
  );

  /// All field definitions for [Attachment].
  static const fieldDefinitions = [
    contentTypeField,
    languageField,
    dataField,
    urlField,
    sizeField,
    hashField,
    titleField,
    creationField,
  ];

  static String? _getContentType(JsonObject jo) =>
      jo[contentTypeField.name].stringValue;

  static String? _getLanguage(JsonObject jo) =>
      jo[languageField.name].stringValue;

  static String? _getData(JsonObject jo) => jo[dataField.name].stringValue;

  static String? _getUrl(JsonObject jo) => jo[urlField.name].stringValue;

  static String? _getSize(JsonObject jo) => jo[sizeField.name].stringValue;

  static String? _getHash(JsonObject jo) => jo[hashField.name].stringValue;

  static String? _getTitle(JsonObject jo) => jo[titleField.name].stringValue;

  static String? _getCreation(JsonObject jo) =>
      jo[creationField.name].stringValue;

  /// Creates a copy of the [Attachment] instance and allows
  /// for non-destructive mutation.
  Attachment copyWith({
    String? contentType,
    String? language,
    String? data,
    String? url,
    String? size,
    String? hash,
    String? title,
    String? creation,
  }) =>
      Attachment(
        contentType: contentType ?? this.contentType,
        language: language ?? this.language,
        data: data ?? this.data,
        url: url ?? this.url,
        size: size ?? this.size,
        hash: hash ?? this.hash,
        title: title ?? this.title,
        creation: creation ?? this.creation,
      );
}
