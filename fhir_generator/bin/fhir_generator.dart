import 'dart:io';

import 'package:jayse/jayse.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    args = ['patient.json'];
    // print(
    //     'Please provide the path to the JSON file as a command-line argument.');
    // exit(1);
  }

  final jsonFilePath = args[0];
  final jsonString = File(jsonFilePath).readAsStringSync();
  final allData = jsonValueDecode(jsonString) as JsonObject;

  final snapshot = allData['snapshot'] as JsonObject;

  var element = snapshot['element'] as JsonArray;

  var resourceelement = element[0];
  final resourceName = resourceelement['id'].stringValue;
  final resourceDefinition = resourceelement['definition'].stringValue;

  //Remove the first element
  element = JsonArray(element.value.sublist(1));

  final dartCode = generateDartCode(
    resourceName ?? 'N/A',
    resourceDefinition ?? 'N/A',
    element,
  );

  print(dartCode);
}

String generateDartCode(
  String resourceName,
  String resourceDefinition,
  JsonArray element,
) {
  final fields = <String>[];
  final fieldDefinitions = <String>[];

  for (final elementItem in element.value) {
    final path = elementItem['path'].stringValue;

    if (path == null) throw Exception('Path is null or not a string');

    var elementItemType = elementItem['type'] as JsonArray;
    final type = elementItemType[0]['code'] as JsonString;

    if (path.split('.').length == 2 && type != null) {
      final fieldName = path.split('.')[1];
      final dartType = mapFhirTypeToDartType(type.value);

      fields.add('$dartType? $fieldName');

      final description = elementItem['definition'] as JsonString;
      final isRequired = elementItem['min'] as JsonNumber;
      // final allowedStringValues =
      //     elementItem['fixedCode'] != null ? [elementItem['fixedCode']] : [];

      final fieldDefinition = '''
  /// Field definition for [$fieldName].
  static const ${fieldName}Field = FieldDefinition(
    name: '$fieldName',
    getValue: _get${fieldName.capitalize()},
    description: '$description',
    isRequired: $isRequired,
  );
''';

//    allowedStringValues: ${allowedStringValues.map((v) => "'$v'").toList()},

      fieldDefinitions.add(fieldDefinition);
    }
  }

  final dartCode = '''
/// $resourceDefinition
class $resourceName extends Resource {
  /// Constructs a new [$resourceName].
  $resourceName({
    String? id,
    Meta? meta,
    ${fields.join(',\n    ')}
  }) : super._internal(
          JsonObject({
            if (id != null) Resource.idField.name: JsonString(id),
            if (meta != null) Resource.metaField.name: meta.json,
            ${fields.map((field) {
    final fieldName = field.split(' ')[1].replaceAll('?', '');
    return "if ($fieldName != null) ${fieldName}Field.name: ${fieldName}Field.toJson($fieldName),";
  }).join('\n            ')}
          }),
        );

  /// Creates a [$resourceName] instance from the provided JSON object.
  $resourceName.fromJson(JsonObject json) : super._internal(json);

  ${fields.map((field) {
    final fieldName = field.split(' ')[1].replaceAll('?', '');
    final dartType = field.split(' ')[0].replaceAll('?', '');
    return '/// $fieldName\n  $dartType? get $fieldName => ${fieldName}Field.getValue(json);';
  }).join('\n\n  ')}

  ${fieldDefinitions.join('\n')}

  /// R4: All field definitions for [$resourceName].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    ${fields.map((field) => '${field.split(' ')[1].replaceAll('?', '')}Field').join(',\n    ')},
  ];

  /// Creates a copy of the [$resourceName] instance and allows for non-destructive mutation.
  $resourceName copyWith({
    String? id,
    Meta? meta,
    ${fields.map((field) => '${field.split(' ')[0]} ${field.split(' ')[1]}').join(',\n    ')}
  }) =>
      $resourceName(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        ${fields.map((field) {
    final fieldName = field.split(' ')[1].replaceAll('?', '');
    return '$fieldName: $fieldName ?? this.$fieldName';
  }).join(',\n        ')}
      );
}
''';

  return dartCode;
}

String mapFhirTypeToDartType(String fhirType) {
  switch (fhirType) {
    case 'string':
      return 'String';
    case 'boolean':
      return 'bool';
    case 'dateTime':
      return 'DateTime';
    case 'code':
      return 'String';
    default:
      return 'dynamic';
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
