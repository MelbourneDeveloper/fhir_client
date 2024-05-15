import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    args = ['patient.json'];
    // print(
    //     'Please provide the path to the JSON file as a command-line argument.');
    // exit(1);
  }

  final jsonFilePath = args[0];
  final jsonString = File(jsonFilePath).readAsStringSync();
  final allData = json.decode(jsonString);

  final snapshot = allData['snapshot'];

  final resourceName = snapshot['element'][0]['id'];
  final resourceDefinition = snapshot['element'][0];

  final dartCode = generateDartCode(resourceName, resourceDefinition);
  print(dartCode);
}

String generateDartCode(
  String resourceName,
  Map<String, dynamic> resourceDefinition,
) {
  final fields = <String>[];
  final fieldDefinitions = <String>[];

  for (final element in resourceDefinition['element']) {
    final path = element['path'];
    final type = element['type']?[0]['code'];

    if (path.split('.').length == 2 && type != null) {
      final fieldName = path.split('.')[1];
      final dartType = mapFhirTypeToDartType(type);

      fields.add('$dartType? $fieldName');

      final description = element['definition'] ?? '';
      final isRequired = element['min'] == 1;
      final allowedStringValues =
          element['fixedCode'] != null ? [element['fixedCode']] : [];

      final fieldDefinition = '''
  /// Field definition for [$fieldName].
  static const ${fieldName}Field = FieldDefinition(
    name: '$fieldName',
    getValue: _get${fieldName.capitalize()},
    description: '$description',
    isRequired: $isRequired,
    allowedStringValues: ${allowedStringValues.map((v) => "'$v'").toList()},
  );
''';

      fieldDefinitions.add(fieldDefinition);
    }
  }

  final dartCode = '''
/// ${resourceDefinition['definition']}
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
