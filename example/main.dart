// ignore_for_file: avoid_print

import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/coding_list.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:http/http.dart';

//The base HAPI API URI
const baseUri = 'http://hapi.fhir.org/';

Future<void> main() async {
  //Use any old HTTP Client and you can mock this
  final client = Client();

  final slotsResult = await client.searchSlots(
    baseUri,
    count: 10,
    status: 'free',
  );

  print('Slots:');
  print(
    // The result can only be BundleEntries<Slot> or
    // OperationOutcome<Slot> so this switch expression is exhaustive
    switch (slotsResult) {
      (final BundleEntries<Slot> slots) =>
        slots.entries.map(_formatSlot).join('\n'),
      (final OperationOutcome<Slot> oo) =>
        'Error: ${oo.text!.status}\n${oo.text?.div}',
    },
  );

  //Search schedules and limit by count
  final searchSchedulesResult =
      await client.searchSchedules(baseUri, count: 10);

  print('Schedules:');
  print(
    switch (searchSchedulesResult) {
      (final BundleEntries<Schedule> schedules) =>
        schedules.entries.map(_formatSchedule).join('\n'),
      (final OperationOutcome<Schedule> oo) =>
        'Error: ${oo.text!.status}\n${oo.text?.div}',
    },
  );

  final searchPractitionersResult =
      await client.searchPractitionerRoles(baseUri, count: 10);

  print('PractitionerRoles:');
  print(
    switch (searchPractitionersResult) {
      (final BundleEntries<PractitionerRole> be) =>
        be.entries.map(_formatPractitionerRole).join('\n\n'),
      (final OperationOutcome<PractitionerRole> oo) =>
        'Error: ${oo.text!.status}\n${oo.text?.div}',
    },
  );
}

String _formatPractitionerRole(PractitionerRole pr) =>
    'Id: ${pr.id}\nCodes:\n${_formatCodingListList(pr.code)}';

String _formatSlot(Slot slot) => 'Id: ${slot.id}\n'
    'Appointment Type: ${_formatCodingList(slot.appointmentType)}\n'
    'Service Category: ${_formatCodingListList(slot.serviceCategory)}\n'
    'Service Type: ${_formatCodingListList(slot.serviceType)}\n'
    'Start ${slot.start} End: ${slot.end}\nComment: ${slot.comment}\n';

String _formatCodingListList(List<CodingList>? list) =>
    list?.map(_formatCodingList).join('/n') ?? '';

String _formatCodingList(CodingList? cc) =>
    cc?.coding
        ?.map((coding) => '${coding.code} - ${coding.display}')
        .join(', ') ??
    '';

String _formatSchedule(Schedule schedule) {
  final buffer = StringBuffer()
    ..writeln('Schedule ID: ${schedule.id}')
    ..writeln(
      'Slot Start: ${schedule.planningHorizon!.start!.toIso8601String()}',
    )
    ..writeln('Slot End: ${schedule.planningHorizon!.end!.toIso8601String()}')
    ..writeln('Service Types:')
    ..write(_formatCodingListList(schedule.serviceType))
    ..writeln('Service Categories:')
    ..write(_formatCodingListList(schedule.serviceCategory));

  if (schedule.actor != null) {
    buffer.writeln('Actors:');
    for (final actor in schedule.actor!) {
      buffer.writeln(' - ${actor.reference}: ${actor.display ?? 'N/A'}');
    }
  }

  buffer.writeln();
  return buffer.toString();
}
