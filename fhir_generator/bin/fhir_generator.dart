import 'dart:io';

import 'package:jayse/jayse.dart';

class Field {
  Field({
    required this.name,
    required this.type,
    required this.definitionText,
  });

  final String name;
  final String type;
  final String definitionText;

  @override
  String toString() => '$type? $name';
}

void main(List<String> args) {
  if (args.isEmpty) {
    // http://hl7.org/fhir/R4/patient.profile.json
    // ignore: parameter_assignments
    args = ['patient.json'];
  }

  final jsonFilePath = args[0];
  final jsonString = File(jsonFilePath).readAsStringSync();
  final allData = jsonValueDecode(jsonString) as JsonObject;

  final snapshot = allData['snapshot'] as JsonObject;

  var element = snapshot['element'] as JsonArray;

  final resourceElement = element[0];
  final resourceName = resourceElement['id'].stringValue;
  final resourceDefinition = resourceElement['definition'].stringValue;

  // Remove the first element
  element = JsonArray(element.value.sublist(1));

  final dartCode = generateDartCode(
    resourceName ?? 'N/A',
    resourceDefinition ?? 'N/A',
    element,
  );

  // ignore: avoid_print
  print(dartCode);
}

String generateDartCode(
  String resourceName,
  String resourceDefinition,
  JsonArray element,
) {
  final fields = <Field>[];

  for (final elementItem in element.value) {
    final path = elementItem['path'].stringValue;

    if (path == null) throw Exception('Path is null or not a string');

    final typeArray = elementItem['type'] as JsonArray;

    if (path.split('.').length == 2) {
      final fieldName = path.split('.')[1].replaceAll('[x]', '');

      fields.add(
        Field(
          name: fieldName,
          type: arrayToToDartType(typeArray),
          definitionText: '''
  /// Field definition for [$fieldName].
  static const ${fieldName}Field = FieldDefinition(
    name: '$fieldName',
    getValue: _get${fieldName.capitalize()},
    description: ${elementItem['definition'] as JsonString},
    isRequired: ${elementItem['min'] as JsonNumber} == 1,
  );
''',
        ),
      );
    }
  }

  final dartCode = '''
/// $resourceDefinition
class $resourceName extends Resource {
  /// Constructs a new [$resourceName].
  $resourceName({
    ${fields.join(',\n    ')},
  }) : super._internal(
          JsonObject({
            if (id != null) Resource.idField.name: JsonString(id),
            if (meta != null) Resource.metaField.name: meta.json,
            ${fields.map((field) => field.type == 'BoolOrDateTimeChoice' ? "if (${field.name} != null) ${field.name}Field.name: ${field.name}.toJsonString()," : "if (${field.name} != null) ${field.name}Field.name: ${field.name}.json,").join('\n            ')}
          }),
        );

  /// Creates a [$resourceName] instance from the provided JSON object.
  $resourceName.fromJson(JsonObject json) : super._internal(json);

  ${fields.map((field) => '/// ${field.name}\n  ${field.type}? get ${field.name} => ${field.name}Field.getValue(json);').join('\n\n  ')}

  ${fields.map(
            (field) => field.type == 'BoolOrDateTimeChoice'
                ? '''
  static ${field.type}? _get${field.name.capitalize()}(JsonObject jo) {
    final value = jo['${field.name}Field'];
    if (value != null) {
      return BoolOrDateTimeChoice.fromJson(value);
    }
    return null;
  }
'''
                : '''
  static ${field.type}? _get${field.name.capitalize()}(JsonObject jo) {
    final value = jo['${field.name}Field'];
    if (value != null) {
      return ${field.type}.fromJson(value as JsonObject);
    }
    return null;
  }
''',
          ).join('\n')}

  ${fields.map((field) => field.definitionText).join('\n')}

  /// R4: All field definitions for [$resourceName].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    ${fields.map((field) => '${field.name}Field').join(',\n    ')},
  ];

  /// Creates a copy of the [$resourceName] instance and allows for non-destructive mutation.
  $resourceName copyWith({
    String? id,
    Meta? meta,
    ${fields.map((field) => '${field.type} ${field.name}').join(',\n    ')}
  }) =>
      $resourceName(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        ${fields.map((field) => '${field.name}: ${field.name} ?? this.${field.name}').join(',\n        ')}
      );
}
''';

  return dartCode;
}

String arrayToToDartType(JsonArray array) => switch (array) {
      (final JsonArray ja) when ja.length == 0 => throw Exception('Empty type'),
      (final JsonArray ja) when ja.length == 1 && ja[0]['code'] is JsonString =>
        mapFhirTypeToDartType((ja[0]['code'] as JsonString).value),
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

String mapFhirTypeToDartType(String fhirType) => switch (fhirType) {
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
