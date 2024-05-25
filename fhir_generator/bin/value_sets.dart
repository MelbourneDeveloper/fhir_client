//https://hl7.org/fhir/R4/terminologies-valuesets.html

import 'package:fhir_client/models/value_sets/language.dart';
import 'package:fhir_client/models/value_sets/service_type.dart';

final valueSets = <String,
    ({
  String name,
  List<String> values,
  String uri,
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
    uri: 'https://hl7.org/fhir/R4/valueset-appointmentstatus.html',
  ),
  'AdministrativeGender': (
    name: 'AdministrativeGender',
    values: ['male', 'female', 'other', 'unknown'],
    uri: 'http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1',
  ),
  'cancelation-reason': (
    name: 'CancelationReason',
    values: ['pat', 'prac', 'loc', 'org', 'maint', 'nosh'],
    uri:
        'http://terminology.hl7.org/CodeSystem/appointment-cancellation-reason',
  ),
  'MaritalStatus': (
    name: 'MaritalStatus',
    values: ['A', 'D', 'I', 'L', 'M', 'P', 'S', 'T', 'U', 'W', 'UNK'],
    uri: 'http://hl7.org/fhir/ValueSet/marital-status',
  ),
  'Language': (
    name: 'Language',
    values: Language.values.map((e) => e.code).toList(),
    uri: 'http://hl7.org/fhir/ValueSet/languages',
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
    uri: 'http://terminology.hl7.org/CodeSystem/service-category',
  ),
  'service-type': (
    name: 'ServiceType',
    values: ServiceType.values.map((e) => e.code).toList(),
    uri: 'https://hl7.org/fhir/R4/valueset-service-type.html'
  ),
};
