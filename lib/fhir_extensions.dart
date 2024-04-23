import 'dart:convert';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/text.dart';
import 'package:http/http.dart';

extension FhirExtensions on Client {
  Future<Resource> getResource<T>(String baseUri, String path) async {
    try {
      final uri = '$baseUri$path';

      final response = await this.get(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
      );

      try {
        final json = response.body;
        return Resource.fromJson(jsonDecode(json) as Map<String, dynamic>);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        return OperationOutcome<T>(
          text: Text(
            status:
                'Exception or Error occurred when converting JSON to Resource',
            div: e.toString(),
          ),
        );
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return OperationOutcome<T>(
        text: Text(
          status: 'Exception or Error occurred when contacting the FHIR server',
          div: e.toString(),
        ),
      );
    }
  }

  Future<Result<Schedule>> searchSchedules(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      switch (await getResource<Schedule>(
        baseUri,
        '$version/Schedule?${count != null ? '_count=$count' : ''}',
      )) {
        //Error
        (final OperationOutcome<Schedule> o) => o,
        (final Bundle b)
            //Check all items are schedules
            when b.entry != null &&
                !b.entry!.any((entry) => entry.resource is! Schedule) =>
          BundleEntries<Schedule>(
            b.entry
                    ?.map(
                      (entry) =>
                          //This is not very nice but we already checked
                          //for null and type above
                          entry.resource! as Schedule,
                    )
                    .toList() ??
                [],
            b,
          ),
        //Unexpected Result
        (final Resource r) => OperationOutcome(
            text: Text(
              status: 'Unexpected Result',
              div: 'Expected a list of Schedules, but '
                  'got a ${r.resourceType}',
            ),
          ),
      };
}
