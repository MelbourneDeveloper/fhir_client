import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:http/http.dart';

//The base API URI
const baseUri = 'http://hapi.fhir.org/';

Future<void> main() async {
  //Use any old HTTP Client and you can mock this
  final client = Client();

  //The path, including the version and query parameters
  //Note: this library will add some helpers to make this more organized
  final result = await client.searchSchedules(baseUri, count: 10);

  //Switch in the resource type to format a display
  // ignore: avoid_print
  print(
    switch (result) {
      (final BundleEntries<Schedule> schedules) =>
        schedules.entries.map(formatSchedule),
      (final OperationOutcome<Schedule> oo) =>
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
