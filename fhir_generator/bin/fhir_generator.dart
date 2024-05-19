// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';
import 'package:jayse/jayse.dart';

import 'field.dart';
import 'field_extensions.dart';
import 'string_extensions.dart';
import 'value_sets.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    // ignore: parameter_assignments
    args = ['patient.json'];
  }

  final (resourceName, resourceDefinition, fields) = processProfile(args[0]);

  final dataClassCode = _generateResourceDataClass(
    resourceName,
    resourceDefinition,
    fields,
  );

  // ignore: avoid_print
  File('patient.dart').writeAsStringSync(dataClassCode);
}

/// Processes the profile JSON and returns the element array and fields.
(
  String resourceName,
  String rsourceDefinition,
  List<Field>,
) processProfile(String fileName) {
  final profileRoot = jsonValueDecode(getProfileJson(fileName)) as JsonObject;

  final elementArray = _getElementArray(profileRoot);

  //Strip the first element because that is for the resource itself
  final fields = _getFields(JsonArray(elementArray.value.sublist(1)));

  return (
    elementArray[0]['id'].stringValue ?? 'N/A',
    elementArray[0]['definition'].stringValue ?? 'N/A',
    fields
  );
}

/// Reads the profile JSON file and returns the contents as a string.
String getProfileJson(String filePath) => File(filePath).readAsStringSync();

/// Generates the static getter body for the field.
String staticGetterBody(Field field) => switch (field) {
      (final Field f) when f.isValueSet => _getValueSetBodySwitch(f),
      (final Field f) when _isArray(f) => _getValueBodyArraySwitch(f),
      (final Field f) when f.types.length == 1 => _getValueBody(f),
      _ => _getBodyChoiceFromJson(field),
    };

/// Generates the field definition list for the Resource
String fieldDefinitionList(String resourceName, List<Field> fields) => '''
/// R4: All field definitions for [$resourceName].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    ${fields.whereNotInherited().map((field) => '${field.name}Field').join(',\n    ')},
  ];''';

String fieldDefinition(Field field) => '''
/// Field definition for [${field.name}].
  static const ${field.name}Field = FieldDefinition(
    name: '${field.name}',
    getValue: _get${field.name.capitalize()},
    description: ${_wrapDefinitionString(field.definition)},
    ${_cardinalityLine(field)}
${field.allowedStringValues != null ? '   allowedStringValues: [${field.allowedStringValues!.map((e) => "'$e'").join(',\n')},],\n' : ''}  );''';

String classAndConstructor(
  String resourceName,
  String resourceDefinition,
  List<Field> fields,
) =>
    '''
/// $resourceDefinition
class $resourceName extends Resource {
  /// Constructs a new [$resourceName].
  $resourceName({
    ${fields.map((f) => f.typeAndName()).join(',\n    ')},
  }) : super._internal(
          JsonObject({
            ${_constructorMapInitializations(fields, resourceName)}  
          }),
        );
''';

String copyWith(String resourceName, List<Field> fields) => '''
/// Creates a copy of the [$resourceName] instance and allows for non-destructive mutation.
  $resourceName copyWith({
${fields.map((field) => '    ${field.dartType}? ${field.name}').join(',\n')},
  }) =>
      $resourceName(
${fields.map((field) => '        ${field.name}: ${field.name} ?? this.${field.name},').join('\n')}
      );
''';

/// Gets the most important array for field definitions.
JsonArray _getElementArray(JsonObject profileRoot) =>
    profileRoot['snapshot']['element'] as JsonArray;

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

      final maxCardinality = elementItem['max'];
      final minCardinality = elementItem['min'].integerValue!;

      final valueSetName = elementItem
          .whereFromPath(
            r'$.binding.extension',
            (p0) => p0['valueString'] is JsonString,
          )
          .firstOrNull?['valueString']
          .stringValue;

      final dartType = _wrapType(
        fieldName,
        typeArray,
        maxCardinality,
        valueSetName,
      );

      final valueSet = valueSets[dartType];

      if (valueSetName != null && valueSet == null) {
        throw Exception('Value set not found for $valueSetName');
      }

      fields.add(
        Field(
          isValueSet: valueSetName != null,
          name: fieldName,
          types: typeArray.value
              .map((e) => e['code'].stringValue)
              .where((t) => t != null)
              .cast<String>()
              .toList(),
          dartType: dartType,
          allowedStringValues: valueSet?.values,
          min: minCardinality,
          max: int.tryParse(maxCardinality.stringValue ?? ''),
          isMaxStar: maxCardinality.stringValue == '*',
          definition: elementItem['definition'].stringValue ?? '',
        ),
      );
    }
  }
  return fields;
}

/// Generates a data class for the resource based on the
/// JSON definition
String _generateResourceDataClass(
  String resourceName,
  String resourceDefinition,
  List<Field> fields,
) =>
    '''
${classAndConstructor(resourceName, resourceDefinition, fields)}

  /// Creates a [$resourceName] instance from the provided JSON object.
  $resourceName.fromJson(JsonObject json) : super._internal(json);

  // Getters

  ${_getters(fields)}

  // Static Get Methods

  ${_staticGetMethods(fields)}

  // Field Definitions

  ${_fieldDefinitions(fields)}

  ${fieldDefinitionList(resourceName, fields)}

  // Non-destructive mutation

  ${copyWith(resourceName, fields)}  
}
''';

String _fieldDefinitions(List<Field> fields) => fields
    .map(
      fieldDefinition,
    )
    .join('\n\n');

String _cardinalityLine(Field field) => field.min == 0 &&
        (field.max == null && !field.isMaxStar)
    //Default cardinality
    ? ''
    //Need to specify cardinality
    : 'cardinality: Cardinality(min: ${field.min}, '
        '${field.max != null ? 'max: IntegerChoice(${field.max}),' : field.isMaxStar ? 'max: BoolChoice(true)' : ''}),';

String _wrapType(
  String fieldName,
  JsonArray typeArray,
  JsonValue maxCardinality,
  String? valueSetName,
) {
  final isList = _isList(maxCardinality);
  final dartType = valueSetName ??
      _arrayToDartType(
        typeArray,
        isList,
      );

  return isList ? 'FixedList<$dartType>' : dartType;
}

bool _isList(JsonValue maxCardinality) =>
    maxCardinality.stringValue == '*' || (maxCardinality.integerValue ?? 0) > 1;

String _staticGetMethods(List<Field> fields) => fields
    .map(
      (field) => '''
static ${field.dartType}? _get${field.name.capitalize()}(JsonObject jo) =>
      ${staticGetterBody(field)};  
''',
    )
    .join('\n');

String _getValueBodyArraySwitch(Field field) => '''
switch (jo[${field.name}Field.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => ${field.types.first}.fromJson(e as JsonObject)),
          ),
        _ => null,
      }''';

String _getValueSetBodySwitch(Field field) => '''
switch (jo[${field.name}Field.name]) {
        (final JsonString js) => ${field.dartType}.fromCode(js.value),
        _ => null,
      }
''';

String _getValueBody(Field field) => switch (field.dartType) {
      'String' => 'jo[${field.name}Field.name].stringValue',
      'bool' => 'jo[${field.name}Field.name].booleanValue',
      'int' => 'jo[${field.name}Field.name].integerValue',
      'Uri' => 'jo[${field.name}Field.name].uriValue',
      'DateTime' =>
        "DateTime.tryParse(jo[${field.name}Field.name].stringValue ?? '')",
      _ => '''
switch(jo[${field.name}Field.name])
{
  (final JsonObject jsonObject) => ${field.dartType}.fromJson(jsonObject),
  _ => null,
} 
''',
    };

String _getBodyChoiceFromJson(Field field) => switch (field.types) {
      ['boolean', 'dateTime'] =>
        'BooleanOrDateTimeChoice.fromJson(jo[${field.name}Field.name])',
      ['boolean', 'integer'] =>
        'BooleanOrIntegerChoice.fromJson(jo[${field.name}Field.name])',
      _ => throw Exception('Invalid type'),
    };

/// Wraps the definition string in a multi-line string.
String _wrapDefinitionString(String definition) => "'''\n$definition'''";

/// Returns the getter methods for the fields.
String _getters(List<Field> fields) => fields
    .whereNotInherited()
    .map(
      (field) =>
          '/*\n${field.definition}\n*/\n ${field.dartType}? get ${field.name} => ${field.name}Field.getValue(json);',
    )
    .join('\n\n  ');

String _constructorMapInitializations(
  List<Field> fields,
  String resourceName,
) =>
    fields
        .map(
          (field) => switch (field) {
            //TODO: this is nasty... Need a flag to indicate that this is a choice type
            (final Field f) when f.dartType.startsWith('BoolOr') =>
              'if (${f.name} != null) ${f.name}Field.name: ${f.name}.toJsonString(),',
            (final Field f) when _isArray(f) =>
              'if (${f.name} != null) ${f.name}Field.name: JsonArray.unmodifiable(${f.name}.map((e) => e.json),),',
            (final Field f) when f.isPrimitive => _primitiveConstructorLine(f),
            _ =>
              'if (${field.name} != null) ${field.name}Field.name: ${field.name}.json,',
          },
        )
        .join('\n            ');

bool _isArray(Field field) => field.isMaxStar || ((field.max ?? 0) > 1);

String _primitiveConstructorLine(Field field) => switch (field.dartType) {
      //Switching on the dart type here, but we might need more detail about the FHIR type...
      'String' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonString(${field.name}),',
      'bool' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonBoolean(${field.name}),',
      'int' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonNumber(${field.name}),',
      'DateTime' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonString(${field.name}.toIso8601String()),',
      'Uri' =>
        'if (${field.name} != null) ${field.name}Field.name: JsonString(${field.name}.toString()),',
      _ => throw Exception('Invalid primitive type'),
    };

String _arrayToDartType(
  JsonArray array,
  bool isArray,
) =>
    switch (array) {
      (final JsonArray ja) when ja.length == 0 => throw Exception('Empty type'),
      (final JsonArray ja) when ja.length == 1 && ja[0]['code'] is JsonString =>
        _mapFhirTypeToDartType(
          (ja[0]['code'] as JsonString).value,
          isArray,
        ),
      (final JsonArray ja) when ja.length == 2 =>
        //Choice Type with 2 choices
        _choiceTypeSwitch(
          [ja[0]['code'].stringValue!, ja[1]['code'].stringValue!],
        ),
      _ => throw Exception('Type unknown'),
    };

String _choiceTypeSwitch(List<String> types) => switch (types) {
      ['boolean', 'dateTime'] => 'BooleanOrDateTimeChoice',
      ['boolean', 'integer'] => 'BooleanOrIntegerChoice',
      _ => throw Exception('Invalid choice type'),
    };

String _mapFhirTypeToDartType(
  String fhirType,
  bool isArray,
) =>
    switch (fhirType) {
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