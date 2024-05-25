import 'dart:io';
import 'package:jayse/jayse.dart';

void main() {
  final json = File('valuesets/administrativegender.json').readAsStringSync();
  final root = jsonValueDecode(json);

  if (root['concept'] is! JsonArray) {
    throw ArgumentError('Expected a JSON array');
  }

  final enumCode = generateValueSetEnum(
    'AdministrativeGender',
    root['concept'] as JsonArray,
  );

  // ignore: avoid_print
  print(enumCode);
}

String generateValueSetEnum(
  String enumName,
  JsonArray concepts,
) =>
    '''
import 'package:jayse/jayse.dart';

/// ${concepts.first['definition']}
enum $enumName implements Comparable<$enumName> {

${concepts.value.map((concept) => _generateEnumCase(concept as JsonObject)).join('\n')}

const $enumName({
  required this.code,
  required this.display,
  required this.definition,
});

final String code;
final String display;
final String definition;

/// Returns the enum value based on the string code, and returns null if
/// no match is found
static $enumName? fromCode(String code) => switch (code) {
  ${concepts.value.map((concept) => "('${concept['code']}') => $enumName.${concept['code']},").join('\n  ')}
  (_) => null,
};

JsonValue get json => JsonString(code);

@override
int compareTo($enumName other) => code == other.code ? 0 : 1;
}
''';

String _generateEnumCase(JsonObject concept) {
  final code = concept['code'] as JsonString;
  final display = concept['display'] as JsonString;
  final definition = concept['definition'] as JsonString;

  return '''
/// $definition
${code.value}(
  code: '${code.value}',
  display: '${display.value}',
  definition: '${definition.value}',
),
''';
}
