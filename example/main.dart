// ignore_for_file: avoid_print

import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:http/http.dart';

//The base HAPI API URI
const baseUri = 'http://hapi.fhir.org/';

Future<void> main() async {
  //Use any old HTTP Client and you can mock this
  final client = Client();

  //Search schedules and limit by count
  final searchSchedulesResult =
      await client.searchSchedules(baseUri, count: 10);

  //Display the result
  print('Schedules:');
  print(
    // The result can only be BundleEntries<Schedule> or
    // OperationOutcome<Schedule> so this switch expression is exhaustive
    switch (searchSchedulesResult) {
      (final BundleEntries<Schedule> schedules) =>
        schedules.entries.map(formatSchedule),
      (final OperationOutcome<Schedule> oo) =>
        'Error: ${oo.text!.status}\n${oo.text?.div}',
    },
  );

  final searchPractitionersResult =
      await client.searchPractitionerRoles(baseUri, count: 10);

  print('PractitionerRoles:');
  print(
    switch (searchPractitionersResult) {
      (final BundleEntries<PractitionerRole> be) => be.entries
          .map(
            (pr) => 'Id: ${pr.id}\nCodes:\n${pr.code?.map(
                  (cc) => cc.coding
                      ?.map(
                        (coding) => ' - '
                            '${coding.code} System: ${coding.system} '
                            '${coding.display}',
                      )
                      .join('\n'),
                ).join('\n')}',
          )
          .join('\n\n'),
      (final OperationOutcome<PractitionerRole> oo) =>
        'Error: ${oo.text!.status}\n${oo.text?.div}',
    },
  );
}

String formatSchedule(Schedule schedule) {
  final start = DateTime.parse(schedule.planningHorizon!.start!);
  final end = DateTime.parse(schedule.planningHorizon!.end!);

  final buffer = StringBuffer()
    ..writeln('Schedule ID: ${schedule.id}')
    ..writeln('Slot Start: ${start.toIso8601String()}')
    ..writeln('Slot End: ${end.toIso8601String()}');

  if (schedule.serviceType != null) {
    buffer.writeln('Service Types:');
    for (final type in schedule.serviceType!) {
      buffer.writeln(
        ' - ${type.coding?.map((e) => '${e.code}: ${e.display}').join('\n')}',
      );
    }
  }

  if (schedule.serviceCategory != null) {
    buffer.writeln('Service Categories:');
    for (final category in schedule.serviceCategory!) {
      buffer.writeln(
        ' - '
        '${category.coding?.map((e) => '${e.code}: ${e.display}').join('\n')}',
      );
    }
  }

  if (schedule.actor != null) {
    buffer.writeln('Actors:');
    for (final actor in schedule.actor!) {
      buffer.writeln(' - ${actor.reference}: ${actor.display ?? 'N/A'}');
    }
  }

  buffer.writeln();
  return buffer.toString();
}
