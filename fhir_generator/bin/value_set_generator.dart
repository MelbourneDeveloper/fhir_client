import 'dart:io';
import 'package:jayse/jayse.dart';

void main() {
  final json = File('valuesets/administrativegender.json').readAsStringSync();
  _processValueSet(json);
}

/// Process the value set JSON
void _processValueSet(String json) {
  final root = jsonValueDecode(json);

  if (root['concept'] is! JsonArray) {
    throw ArgumentError('Expected a JSON array');
  }

  final name = (root['name'] as JsonString).value;
  final enumCode = generateValueSetEnum(
    name,
    (root['description'] as JsonString).value,
    root['concept'] as JsonArray,
  );

  File('output/${name.toLowerCase()}.dart').writeAsStringSync(enumCode);
}

/// Generate the enum code
String generateValueSetEnum(
  String name,
  String description,
  JsonArray concepts,
) =>
    '''
import 'package:jayse/jayse.dart';

/// $description
enum $name implements Comparable<$name> {

${concepts.value.map((concept) => _generateEnumCase(concept as JsonObject)).join(',\n\n')};

const $name({
  required this.code,
  required this.display,
  required this.definition,
});

/// The property that represents the unique identifier 
/// for a specific concept within the value set.
final String code;

/// A human-readable string to display to the user.
final String display;

/// Provides a more detailed explanation or description of the concept
final String definition;

/// Returns the enum value based on the string code, and returns null if
/// no match is found
static $name? fromCode(String code) => switch (code) {
  ${concepts.value.map((concept) {
      final code = (concept['code'] as JsonString).value;
      return "('$code') => $name.$code,";
    }).join('\n  ')}
  (_) => null,
};

/// Converts the code to a JsonString for the purpose of JSON
/// serialization
JsonValue get json => JsonString(code);

@override
int compareTo($name other) => code == other.code ? 0 : 1;
}
''';

/// Generate the enum case
String _generateEnumCase(JsonObject concept) {
  final code = concept['code'] as JsonString;
  final display = concept['display'] as JsonString;
  final definition = concept['definition'] as JsonString;

  return '''
/// ${definition.value}
${code.value}(
  code: '${code.value}',
  display: '${display.value}',
  definition: '${definition.value}',
)''';
}
