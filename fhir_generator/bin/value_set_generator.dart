import 'dart:io';
import 'package:jayse/jayse.dart';
import 'package:path/path.dart' as path;

// Example JSON: https://hl7.org/fhir/r4/codesystem-activity-definition-category.json
// List of value sets: https://fhir-ru.github.io/terminologies-valuesets.html

// Actually: perhaps this is correct: https://hl7.org/fhir/r4/valueset-c80-practice-codes.canonical.json

void main() {
  final definitionFiles = Directory('./valuesets/')
      .listSync()
      .where((file) => file is File && path.extension(file.path) == '.json');

  for (final definitionFile in definitionFiles) {
    final file = File(definitionFile.path);

    final (name, code) = _processValueSet(file.readAsStringSync());

    File(
      path.join(
        'output',
        '${path.basenameWithoutExtension(name.toLowerCase())}.dart',
      ),
    ).writeAsStringSync(code);
  }
}

/// Process the value set JSON
(String, String) _processValueSet(String json) {
  final root = jsonValueDecode(json);

  var concept = root['concept'];

  if (concept is Undefined) {
    //Concept is not defined at the root level
    //This JSON file might be a composition of multiple value sets

    final include = root['compose']['include'];

    if (include is! JsonArray) {
      throw ArgumentError("'concept' is not a JSON array, and "
          "'compose' -> 'include' is not a JSON Array");
    }

    concept = include[0]['concept'];

    if (concept is! JsonArray) {
      throw ArgumentError(
        "'compose' -> 'include' -> [0] -> 'concept'  is not a JSON Array",
      );
    }

    final sortedUniqueCodes = _getSortedUniqueCodes(concept);

    concept = JsonArray(sortedUniqueCodes);
  }

  if (concept is! JsonArray) {
    throw ArgumentError('Expected a JSON array');
  }

  final name = (root['name'] as JsonString).value;
  final enumCode = generateValueSetEnum(
    name,
    (root['description'] as JsonString).value,
    concept,
  );

  return (name, enumCode);
}

/// Generate the enum code
String generateValueSetEnum(
  String name,
  String description,
  JsonArray conceptsArray,
) {
  final concepts = conceptsArray.value.cast<JsonObject>().toList()
    ..sort(
      (a, b) => a['code'].stringValue!.compareTo(b['code'].stringValue!),
    );

  return '''
// ignore_for_file: lines_longer_than_80_chars
import 'package:jayse/jayse.dart';

/// $description
enum $name implements Comparable<$name> {

${concepts.map(_generateEnumCase).join(',\n\n')};

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
  ${concepts.map((concept) {
    final code = (concept['code'] as JsonString).value;
    return "('$code') =>  $name.${_safeName(code)},";
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
}

/// Generate the enum case
String _generateEnumCase(JsonObject concept) {
  final code = concept['code'] as JsonString;
  final display = concept['display'] as JsonString;
  final definition = switch (concept['definition']) {
    (final JsonString js) => js.value,
    (_) => null,
  };

  return '''
/// ${definition ?? display.value}
${_safeName(code.value)}(
  code: '${code.value}',
  display: ${_safeQuoteWrap(display.value)},
  definition: ${_safeQuoteWrap(definition ?? '')},
)''';
}

bool _isValidDartIdentifier(String identifier) {
  final identifierRegex = RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$');
  return identifierRegex.hasMatch(identifier);
}

String _safeName(String code) => _isValidDartIdentifier(code) ? code : 'n$code';

String _safeQuoteWrap(String value) =>
    value.contains("'") ? '"$value"' : "'$value'";

List<JsonObject> _getSortedUniqueCodes(JsonArray concept) {
  //List of concepts, where code may not be unique
  final list = concept.value.cast<JsonObject>().toList()
    ..sort(
      (a, b) => int.parse(a['code'].stringValue!)
          .compareTo(int.parse(b['code'].stringValue!)),
    );

  final uniqueList = <JsonObject>[];
  final seenCodes = <String>{};

  for (final item in list) {
    final code = item['code'].stringValue!;
    if (!seenCodes.contains(code)) {
      uniqueList.add(item);
      seenCodes.add(code);
    }
  }

  return uniqueList;
}
