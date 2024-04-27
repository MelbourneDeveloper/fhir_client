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

  //Call the 3 search functions in parallel. This is safe because the
  //calls won't throw an Exception/Error. If there is an error, the result
  //will be an OperationOutcome, and you can handle that with the switch
  //expression
  final results = await Future.wait([
    client.searchSlots(
      baseUri,
      count: 10,
      status: 'free',
    ),
    client.searchSchedules(baseUri, count: 10),
    client.searchPractitionerRoles(baseUri, count: 10),
  ]);

  final formattedResult = results
      .map(
        (result) => switch (result) {
          (final BundleEntries<Schedule> schedules) =>
            'Schedules:\n\n${schedules.formatResult(_formatSchedule)}',
          (final BundleEntries<Slot> slots) =>
            'Slots:\n\n${slots.formatResult(_formatSlot)}',
          (final BundleEntries<PractitionerRole> roles) =>
            'PractitionerRoles:\n\n'
                '${roles.formatResult(_formatPractitionerRole)}',
          BundleEntries<Resource>() => "This case shouldn't happen, but the "
              "compiler doesn't know this.",
          // ignore: strict_raw_type
          (final OperationOutcome oo) =>
            'Error: ${oo.text!.status}\n${oo.text?.div}',
        },
      )
      .join('\n');

  print(formattedResult);
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
extension ResultExtensions<T> on BundleEntries<T> {
  String formatResult(String Function(T) format) =>
      entries.map(format).join('\n');
}
