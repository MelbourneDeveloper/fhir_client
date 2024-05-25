import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/value_sets/activity_definition_category.dart';
import 'package:fhir_client/models/value_sets/value_set_concept.dart';
import 'package:jayse/jayse.dart';
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

        final actor1 = Actor(reference: 'reference1', display: 'Actor 1');
        final actor2 = Actor(reference: 'reference2', display: 'Actor 2');
        final actor3 = Actor(reference: 'reference3', display: 'Actor 3');

        final list1 = FixedList([actor1, actor2, actor3]);
        final list2 = FixedList([actor1, actor2, actor3]);

        expect(list1.hashCode, equals(list2.hashCode));
      },
    );
  });

  group('Value Sets', () {
    test('Activity Definition', () {
      final assessment = ActivityDefinitionCategory.fromCode('assessment');
      expect(assessment, equals(ActivityDefinitionCategory.assessment));
      expect(assessment!.code, equals('assessment'));

      final asValueSet = assessment as ValueSetConcept;
      expect(asValueSet.code, equals('assessment'));
      expect(asValueSet.compareTo(ActivityDefinitionCategory.assessment), 0);
      expect(asValueSet.json, const JsonString('assessment'));
    });
  });
}
