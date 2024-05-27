// Currently generates for R4.
// The patient.json file URL is https://hl7.org/fhir/R4/patient.profile.json
// Version history: http://hl7.org/fhir/directory.html
// However, V5 will most likely be the better version to run with

import 'dart:io';
import 'package:path/path.dart' as path;
import 'fhir_generator.dart';

void main() {

  //TODO: generate the enum file for this https://hl7.org/fhir/r4/codesystem-administrative-gender.json

  final definitionFiles = Directory('./definitions/')
      .listSync()
      .where((file) => file is File && path.extension(file.path) == '.json');

  for (final definitionFile in definitionFiles) {
    final filename = definitionFile.path;

    File(path.join('output', '${path.basenameWithoutExtension(filename)}.dart'))
        .writeAsStringSync(generateFromJson(filename));
  }
}
