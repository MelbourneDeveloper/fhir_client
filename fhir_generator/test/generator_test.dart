import 'package:jayse/jayse.dart';
import 'package:test/scaffolding.dart';

import '../bin/fhir_generator.dart';

void main() {
  test('Get Fields', () {
    
    final profileRoot =
        jsonValueDecode(getProfileJson('patient.json')) as JsonObject;

    // ignore: unused_local_variable
    final elementArray =
        JsonArray(getElementArray(profileRoot).value.sublist(1));
  });
}
