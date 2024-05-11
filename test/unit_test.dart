/*

import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/time.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/tag.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'fhir_client_test.dart';

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

        final actor1 =
            Actor(reference: 'reference1', display: 'Actor 1');
        final actor2 =
            Actor(reference: 'reference2', display: 'Actor 2');
        final actor3 =
            Actor(reference: 'reference3', display: 'Actor 3');

        final list1 = FixedList([actor1, actor2, actor3]);
        final list2 = FixedList([actor1, actor2, actor3]);

        expect(list1.hashCode, equals(list2.hashCode));
      },
    );

    test('AvailableTime equality and hash code', () {
      //TODO More Time parsing and testing

      final nineAM = Time('09:00');
      expect(nineAM.value!.hour, 9);
      expect(nineAM.value!.minute, 0);
      expect(nineAM.value!.second, 0);
      // Test case 1: Equal objects

      final availableTime1 = AvailableTime(
        daysOfWeek: FixedList<String>(['Monday', 'Tuesday']),
        availableStartTime: StringBackedValue('09:00'),
        availableEndTime: Time.tryParse('17:00'),
      );
      final availableTime2 = AvailableTime(
        daysOfWeek: FixedList<String>(['Monday', 'Tuesday']),
        availableStartTime: StringBackedValue('09:00'),
        availableEndTime: Time.tryParse('17:00'),
      );
      expect(availableTime1, equals(availableTime2));
      expect(availableTime1.hashCode, equals(availableTime2.hashCode));

      // Test case 2: Unequal objects (different daysOfWeek)
      final availableTime3 = AvailableTime(
        daysOfWeek: FixedList<String>(['Wednesday', 'Thursday']),
        availableStartTime: nineAM,
        availableEndTime: Time.tryParse('17:00'),
      );
      expect(availableTime1, isNot(equals(availableTime3)));
      expect(availableTime1.hashCode, isNot(equals(availableTime3.hashCode)));

      // Test case 3: Unequal objects (different availableStartTime)
      final availableTime4 = AvailableTime(
        daysOfWeek: FixedList<String>(['Monday', 'Tuesday']),
        availableStartTime: StringBackedValue('10:00'),
        availableEndTime: Time.tryParse('17:00'),
      );
      expect(availableTime1 == availableTime4, false);
      expect(availableTime1.hashCode, isNot(equals(availableTime4.hashCode)));

      // Test case 4: Unequal objects (different availableEndTime)
      final availableTime5 = AvailableTime(
        daysOfWeek: FixedList<String>(['Monday', 'Tuesday']),
        availableStartTime: nineAM,
        availableEndTime: Time.tryParse('18:00'),
      );
      expect(availableTime1, isNot(equals(availableTime5)));
      expect(availableTime1.hashCode, isNot(equals(availableTime5.hashCode)));

      // Test case 5: Null values
      final availableTime6 =
          AvailableTime(availableStartTime: StringBackedValue(null));
      final availableTime7 =
          AvailableTime(availableStartTime: StringBackedValue(null));
      expect(availableTime6, equals(availableTime7));
      expect(availableTime6.hashCode, equals(availableTime7.hashCode));
    });
  });

  group('Misc', () {
    test('orderBy', () {
      //Order your lists like this
      expect([3, 1, 2].orderBy(), containsAllInOrder([1, 2, 3]));
    });

    test('No exceptions', () async {
      final result =
          await MockClient((r) async => throw Exception('Simulated exception'))
              .getResource<Patient>(
        'https://example.com',
        '/baseR4/Patient',
      );

      expect(result, isA<OperationOutcome<Patient>>());
      expect(
        (result as OperationOutcome).text!.status,
        'Exception or Error occurred when contacting the FHIR server',
      );
      expect(
        result.text!.div,
        'Exception: Simulated exception',
      );
    });
  });

  group('Json Object', () {
    test('Tag', () {
      final tag = Tag(
        code: Defined('code'),
        system: Defined(Uri.parse('http://www.url.com')),
      );
      expect(tag.code, isA<Defined<String>>());
      expectEquals(tag.code as Defined<String>, 'code');

      const system = 'sdfsdfsfd';
      final tag2 = Tag.fromJson({'system': system});
      final map = tag2.toJson();
      expect(map['system'], system);

      final tag3 = tag2.copyWith(code: Defined('new code'));
      expectEquals(tag3.code, 'new code');

      final tag4 = tag3.copyWith(code: const Undefined());
      expectEquals(tag4.code, const Undefined<String>());
    });
  });
}

*/
