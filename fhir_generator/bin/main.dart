// Currently generates for R4.
// The patient.json file URL is https://hl7.org/fhir/R4/patient.profile.json
// Version history: http://hl7.org/fhir/directory.html
// However, V5 will most likely be the better version to run with

import 'dart:io';
import 'package:path/path.dart' as path;
import 'fhir_generator.dart';

void main() {
  final definitionFiles = Directory('./definitions/')
      .listSync()
      .where((file) => file is File && path.extension(file.path) == '.json');

  for (final definitionFile in definitionFiles) {
    final filename = definitionFile.path;
    final dataClassCode = generateFromJson(filename);
    final outputFilename = '${path.basenameWithoutExtension(filename)}.dart';
    File(outputFilename).writeAsStringSync(dataClassCode);
  }
}
