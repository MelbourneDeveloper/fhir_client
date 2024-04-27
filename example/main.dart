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

  print('Slots:\n\n${slotsResult.formatResult(_formatSlot)}');

  //Search schedules and limit by count
  final searchSchedulesResult =
      await client.searchSchedules(baseUri, count: 10);

  print('Schedules:\n\n${searchSchedulesResult.formatResult(_formatSchedule)}');

  final searchPractitionersResult =
      await client.searchPractitionerRoles(baseUri, count: 10);

  print(
    'PractitionerRoles:\n\n'
    '${searchPractitionersResult.formatResult(_formatPractitionerRole)}',
  );
}

String _formatCodingListList(List<CodingList>? list) =>
    list?.map(_formatCodingList).join('/n') ?? '';

String _formatCodingList(CodingList? cc) =>
    cc?.coding
        ?.map((coding) => '${coding.code} - ${coding.display}')
        .join(', ') ??
    '';

String _formatPractitionerRole(PractitionerRole pr) =>
    'Id: ${pr.id}\nCodes:\n${_formatCodingListList(pr.code)}\n';

String _formatSlot(Slot slot) => 'Id: ${slot.id}\n'
    'Appointment Type: ${_formatCodingList(slot.appointmentType)}\n'
    'Service Category: ${_formatCodingListList(slot.serviceCategory)}\n'
    'Service Type: ${_formatCodingListList(slot.serviceType)}\n'
    'Start ${slot.start} End: ${slot.end}\nComment: ${slot.comment}\n';

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

  return buffer.toString();
}

/// Extensions for formatting results in this context
///
/// Note: that the resoures don't have toString implementations.
/// They might be added in future, but formatting strings is
/// usually context sensitive, so there's not much point pre-empting
/// the format for the context.
extension ResultExtensions<T> on Result<T> {
  String formatResult(String Function(T) format) => switch (this) {
        // The result can only be BundleEntries<T> or
        // OperationOutcome<T> so this switch expression is exhaustive
        (final BundleEntries<T> schedules) =>
          schedules.entries.map(format).join('\n'),
        (final OperationOutcome<T> oo) =>
          'Error: ${oo.text!.status}\n${oo.text?.div}',
      };
}
