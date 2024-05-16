// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';
import 'package:jayse/jayse.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    // ignore: parameter_assignments
    args = ['patient.json'];
  }

  final jsonFilePath = args[0];
  final jsonString = File(jsonFilePath).readAsStringSync();
  final allData = jsonValueDecode(jsonString) as JsonObject;

  final snapshot = allData['snapshot'] as JsonObject;
  var elementArray = snapshot['element'] as JsonArray;

  final resourceElement = elementArray[0];
  final resourceName = resourceElement['id'].stringValue;
  final resourceDefinition = resourceElement['definition'].stringValue;

  elementArray = JsonArray(elementArray.value.sublist(1));

  final dataClassCode = _generateResourceDataClass(
    resourceName ?? 'N/A',
    resourceDefinition ?? 'N/A',
    elementArray,
  );

  // ignore: avoid_print
  print(dataClassCode);
}

/// Generates a data class for the resource based on the
/// JSON definition
String _generateResourceDataClass(
  String resourceName,
  String resourceDefinition,
  JsonArray element,
) {
  final fields = _getFields(element);

  return '''
/// $resourceDefinition
class $resourceName extends Resource {
  /// Constructs a new [$resourceName].
  $resourceName({
    ${fields.join(',\n    ')},
  }) : super._internal(
          JsonObject({
            ${_constructorMapInitializations(fields, resourceName)}  
          }),
        );

  /// Creates a [$resourceName] instance from the provided JSON object.
  $resourceName.fromJson(JsonObject json) : super._internal(json);

  ${_getters(fields)}

  ${_staticGetMethods(fields)}

  ${fields.map((field) => field.definitionText).join('\n')}

  /// R4: All field definitions for [$resourceName].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    ${fields.whereNotInherited().map((field) => '${field.name}Field').join(',\n    ')},
  ];

  /// Creates a copy of the [$resourceName] instance and allows for non-destructive mutation.
  $resourceName copyWith({
    ${fields.map((field) => '${field.type}? ${field.name}').join(',\n    ')},
  }) =>
      $resourceName(
        ${fields.map((field) => '${field.name}: ${field.name} ?? this.${field.name}').join(',\n        ')}
      ,);
}
''';
}

/// Convert all the fields in the JSON definition to a list of [Field] objects.
List<Field> _getFields(JsonArray element) {
  final fields = <Field>[];

  // Iterate through each of the "element" nodes
  for (final elementItem in element.value) {
    final path = elementItem['path'].stringValue;
    if (path == null) throw Exception('Path is null or not a string');

    final typeArray = elementItem['type'] as JsonArray;

    if (path.split('.').length == 2) {
      final fieldName = path.split('.')[1].replaceAll('[x]', '');
      final allowedStringValues = elementItem['binding']
          .objectValue?['valueSet']
          .stringValue
          ?.split('|')
          .map((e) => e.trim())
          .toList();

      final maxCardinality = elementItem['max'];
      final minCardinality = elementItem['min'].integerValue!;

      fields.add(
        Field(
          name: fieldName,
          type: fieldName == 'gender'
              ? 'AdministrativeGender'
              : _arrayToDartType(typeArray),
          definitionText: '''
  /// Field definition for [$fieldName].
  static const ${fieldName}Field = FieldDefinition(
    name: '$fieldName',
    getValue: _get${fieldName.capitalize()},
    description: ${_wrapDefinitionString(elementItem)},
    cardinality: Cardinality(min: $minCardinality, max: ${maxCardinality.integerValue != null ? 'IntegerChoice(${maxCardinality.integerValue})' : 'null'},),
    ${allowedStringValues != null ? '\n    allowedStringValues: [${allowedStringValues.map((e) => "'e'").join(',\n')}],' : ''}
  );
  ''',
          allowedStringValues: allowedStringValues,
          min: minCardinality,
          max: maxCardinality.integerValue,
          isMaxStar: maxCardinality.stringValue == '*',
        ),
      );
    }
  }
  return fields;
}

String _staticGetMethods(List<Field> fields) => fields
    .map(
      (field) => '''
static ${field.type} _get${field.name.capitalize()}(JsonObject jo) =>
    ${field.jsonValue};  
''',
    )
    .join('\n');

/// Wraps the definition string in a multi-line string.
String _wrapDefinitionString(JsonValue elementItem) =>
    "'''\n${(elementItem['definition'] as JsonString).value}'''";

/// Returns the getter methods for the fields.
String _getters(List<Field> fields) => fields
    .whereNotInherited()
    .map(
      (field) =>
          '/*\n${field.definitionText.split("description: '''")[1].split("''',")[0].trim()}\n*/\n ${field.type}? get ${field.name} => ${field.name}Field.getValue(json);',
    )
    .join('\n\n  ');

String _constructorMapInitializations(
  List<Field> fields,
  String resourceName,
) =>
    fields
        .map(
          (field) => switch (field) {
            (final Field f) when f.type.startsWith('BoolOr') =>
              'if (${f.name} != null) ${f.name}Field.name: ${f.name}.toJsonString(),',
            (final Field f) when f.isPrimitive => _primitiveConstructorLine(f),
            (final Field f) when _isArray(f) =>
              "if (${f.name} != null) ${f.name}Field.name: JsonArray.unmodifiable(${f.name}${f.type == 'FixedList<$resourceName>' ? '.map((e) => e.json)' : ''}),",
            _ =>
              'if (${field.name} != null) ${field.name}Field.name: ${field.name}.json,',
          },
        )
        .join('\n            ');

bool _isArray(Field field) => field.isMaxStar || ((field.max ?? 0) > 1);

String _primitiveConstructorLine(Field field) => switch (field.type) {
      'String' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonString(${field.name}),',
      'bool' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonBoolean(${field.name}),',
      'int' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonNumber(${field.name}),',
      'DateTime' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonString(${field.name}.toIso8601String()),',
      _ => throw Exception('Invalid primitive type'),
    };

String _arrayToDartType(JsonArray array) => switch (array) {
      (final JsonArray ja) when ja.length == 0 => throw Exception('Empty type'),
      (final JsonArray ja) when ja.length == 1 && ja[0]['code'] is JsonString =>
        _mapFhirTypeToDartType((ja[0]['code'] as JsonString).value),
      (final JsonArray ja)
          when ja.length == 2 &&
              ja[0]['code'].stringValue == 'boolean' &&
              ja[1]['code'].stringValue == 'dateTime' =>
        'BooleanOrDateTimeChoice',
      (final JsonArray ja)
          when ja.length == 2 &&
              ja[0]['code'].stringValue == 'boolean' &&
              ja[1]['code'].stringValue == 'integer' =>
        'BooleanOrIntegerChoice',
      _ => throw Exception('Type case not handled')
    };

String _mapFhirTypeToDartType(String fhirType) => switch (fhirType) {
      'string' => 'String',
      'http://hl7.org/fhirpath/System.String' => 'String',
      'boolean' => 'bool',
      'http://hl7.org/fhirpath/System.Boolean' => 'bool',
      'date' => 'DateTime',
      'dateTime' => 'DateTime',
      'http://hl7.org/fhirpath/System.DateTime' => 'DateTime',
      'uri' => 'Uri',
      'code' => 'String',
      'http://hl7.org/fhirpath/System.Integer' => 'int',
      _ => fhirType,
    };

extension StringExtensions on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}

class Field {
  Field({
    required this.name,
    required this.type,
    required this.definitionText,
    required this.min,
    required this.max,
    required this.isMaxStar,
    this.allowedStringValues,
  });

  final String name;
  final String type;
  final String definitionText;
  // Buh?
  // ignore: unreachable_from_main
  final int min;
  final int? max;
  final bool isMaxStar;
  final List<String>? allowedStringValues;

  bool get isPrimitive => switch (type) {
        'String' => true,
        'bool' => true,
        'int' => true,
        'DateTime' => true,
        _ => false,
      };

  String get jsonValue => switch (type) {
        'String' => allowedStringValues != null
            ? 'switch (jo[${name}Field.name]) {(final JsonString jsonString) => jsonString.value, _ => null,}'
            : 'jo[${name}Field.name].stringValue',
        'bool' => 'jo[${name}Field.name].booleanValue',
        'int' => 'jo[${name}Field.name].integerValue',
        'DateTime' =>
          "DateTime.tryParse(jo[${name}Field.name].stringValue ?? '')",
        _ => '$type.fromJson(jo[${name}Field.name])',
      };

  @override
  String toString() => '$type? $name';
}

extension Asfsdf on Iterable<Field> {
  Iterable<Field> whereNotInherited() => where(
        (field) => ![
          'meta',
          'id',
        ].contains(field.name),
      );
}
