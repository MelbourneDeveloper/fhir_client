//https://hl7.org/fhir/R4/terminologies-valuesets.html

import 'package:fhir_client/models/value_sets/language.dart';
import 'package:fhir_client/models/value_sets/practice_setting_code.dart';
import 'package:fhir_client/models/value_sets/service_type.dart';

import '../output/appointmentreason.dart';

final valueSets = <String,
    ({
  String name,
  List<String> values,
})>{
  'AppointmentStatus': (
    name: 'AppointmentStatus',
    values: [
      'proposed',
      'booked',
      'arrived',
      'fulfilled',
      'cancelled',
      'noshow',
      'entered-in-error',
    ],
  ),
  'AdministrativeGender': (
    name: 'AdministrativeGender',
    values: ['male', 'female', 'other', 'unknown'],
  ),
  'cancelation-reason': (
    name: 'CancelationReason',
    values: ['pat', 'prac', 'loc', 'org', 'maint', 'nosh'],
  ),
  'MaritalStatus': (
    name: 'MaritalStatus',
    values: ['A', 'D', 'I', 'L', 'M', 'P', 'S', 'T', 'U', 'W', 'UNK'],
  ),
  'Language': (
    name: 'Language',
    values: Language.values.map((e) => e.code).toList(),
  ),
  'service-category': (
    name: 'ServiceCategory',
    values: [
      '1',
      '2',
      '34',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '36',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '35',
      '18',
      '19',
      '20',
      '21',
      '22',
      '38',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31',
      '32',
      '37',
      '33',
    ],
  ),
  'service-type': (
    name: 'ServiceType',
    values: ServiceType.values.map((e) => e.code).toList(),
  ),
  'specialty': (
    name: 'PraticeSettingCode',
    values: PracticeSettingCode.values.map((e) => e.code).toList(),
  ),
  'appointment-type': (
    name: 'AppointmentReason',
    values: AppointmentReason.values.map((e) => e.code).toList(),
  ),
};
