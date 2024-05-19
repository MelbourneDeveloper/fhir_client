import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/fhir_generator.dart';

void main() {
  test('Get Fields', () {
    final (_, fields) = processProfile('patient.json');

    final first = fields.first;
    expect(first.dartType, 'String');
    expect(first.name, 'id');

    expect(fields.length, 24);
  });
}
