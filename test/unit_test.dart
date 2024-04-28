// ignore_for_file: unused_import

import 'dart:js_util';

import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/fixed_list.dart';
import 'package:test/test.dart';

void main() {
  group('Equality', () {
    test(
      'Actor',
      () {
        expect(
          Actor(reference: '1', display: 'a'),
          equals(Actor(reference: '1', display: 'a')),
        );

        expect(
          Actor(),
          equals(Actor()),
        );

        expect(
          Actor(reference: '1', display: 'a') !=
              Actor(reference: '1', display: 'b'),
          true,
        );
      },
    );
  });

  group('Misc', () {
    test('orderBy', () {
      //Order your lists like this
      expect([3, 1, 2].orderBy(), containsAllInOrder([1, 2, 3]));
    });
  });
}
