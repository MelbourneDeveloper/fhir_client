import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/coding.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/narrative.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/appointment_reason.dart';
import 'package:fhir_client/models/value_sets/appointment_status.dart';
import 'package:fhir_client/models/value_sets/cancelation_reason.dart';
import 'package:fhir_client/models/value_sets/language.dart';
import 'package:fhir_client/models/value_sets/service_category.dart';
import 'package:fhir_client/models/value_sets/service_type.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';

// ignore: unreachable_from_main
final appointment = Appointment(
  id: 'example-id',
  meta: Meta(
    versionId: 'example-version-id',
    lastUpdated: DateTime.now(),
    source: 'http://example.com',
  ),
  implicitRules: Uri.parse('http://example.com/rules'),
  language: Language.fromCode('en'),
  text: Narrative(
    status: NarrativeStatus.generated,
    div: '<div>Example narrative</div>',
  ),
  contained: FixedList([
    // Add contained resources here
  ]),
  extension: FixedList([
    // Add extensions here
  ]),
  modifierExtension: FixedList([
    // Add modifier extensions here
  ]),
  identifier: FixedList([
    Identifier(
      use: 'usual',
      system: Uri.parse('http://example.com/identifiers'),
      value: 'example-identifier',
    ),
  ]),
  status: AppointmentStatus.booked,
  cancelationReason: CancelationReason.patientCancel,
  serviceCategory: FixedList([ServiceCategory.agedCare]),
  serviceType: FixedList([ServiceType.chiropractic]),
  specialty: FixedList([
    CodeableConcept(
      coding: FixedList([
        Coding(
          system: Uri.parse('http://example.com/specialties'),
          code: 'example-specialty',
        ),
      ]),
    ),
  ]),
  appointmentType: AppointmentReason.CHECKUP,
  reasonCode: FixedList([
    CodeableConcept(
      coding: FixedList([
        Coding(
          system: Uri.parse('http://example.com/reasons'),
          code: 'example-reason',
        ),
      ]),
    ),
  ]),
  reasonReference: FixedList([
    Reference(reference: 'Condition/example-condition'),
  ]),
  priority: 1,
  description: 'Example appointment description',
  supportingInformation: FixedList([
    Reference(reference: 'DocumentReference/example-doc-ref'),
  ]),
  start: DateTime.now(),
  end: DateTime.now().add(const Duration(hours: 1)),
  minutesDuration: 60,
  slot: FixedList([
    Reference(reference: 'Slot/example-slot'),
  ]),
  created: DateTime.now(),
  comment: 'Example appointment comment',
  patientInstruction: 'Example patient instructions',
  basedOn: FixedList([
    Reference(reference: 'ServiceRequest/example-service-request'),
  ]),
  participant: FixedList([]),
  requestedPeriod: FixedList([
    Period(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 7)),
    ),
  ]),
);

const primitiveFieldTypes = [
  FieldDefinition<String>,
  FieldDefinition<int>,
  FieldDefinition<num>,
  FieldDefinition<DateTime>,
];

void main() => runApp(const MyApp());

final primitiveFields = Appointment.fieldDefinitions.where(
  (fd) => primitiveFieldTypes.contains(fd.runtimeType),
);

final nonPrimitiveFields = Appointment.fieldDefinitions
    .where(
      (fd) => !primitiveFieldTypes.contains(fd.runtimeType),
    )
    .toFixedList();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Well Navigator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 16),
              Center(
                child: _headingRow(),
              ),
              const SizedBox(height: 16),
              Expanded(child: _listView()),
            ],
          ),
        ),
      );

  Row _headingRow() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event,
            size: 24,
            color: Colors.blue,
          ),
          Text(
            'Appointment',
            style: TextStyle(fontSize: 24),
          ),
        ],
      );

  ListView _listView() => ListView.builder(
        itemCount: nonPrimitiveFields.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Tile(
              headerTooltip: 'Basic Details',
              headerText: 'Details',
              trailing: Wrap(
                children: primitiveFields.map(_field).toList(),
              ),
            );
          } else {
            final nonPrimitiveField = nonPrimitiveFields[index - 1];
            final headerTooltip =
                nonPrimitiveField.description ?? 'No information';
            final headerText = nonPrimitiveField.name;
            return Tile(
              headerTooltip: headerTooltip,
              headerText: headerText,
              trailing: const Text(''),
            );
          }
        },
      );

  Tooltip _field<T>(FieldDefinition<T> fd) {
    final value = fd.getValue(appointment.json);
    final text = value.toString();
    return Tooltip(
      message: fd.description,
      child: SizedBox(
        width: 300,
        height: 80,
        child: Row(
          children: [
            Text(fd.name),
            TextField(
              controller: TextEditingController(text: text),
            ),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    required this.headerTooltip,
    required this.headerText,
    required this.trailing,
    super.key,
  });

  final String headerTooltip;
  final String headerText;
  final Widget trailing;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Tooltip(
          message: headerTooltip,
          child: Text(
            headerText,
          ),
        ),
        subtitle: trailing,
      );
}
