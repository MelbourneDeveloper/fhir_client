import 'dart:convert';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/text.dart';
import 'package:http/http.dart';

/// Extension methods for the http package [Client] class
extension FhirExtensions on Client {
  /// Low level call to get a resource from the FHIR server with raw URL path
  /// Note: it is recommended to use the higher level calls like search etc.
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

  /// Search for [Schedule]s
  Future<Result<Schedule>> searchSchedules(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      search(
        baseUri,
        resourceName: 'Schedule',
        version: version,
        count: count,
      );

  /// Search for [PractitionerRole]s
  Future<Result<PractitionerRole>> searchPractitionerRoles(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      search(
        baseUri,
        resourceName: 'PractitionerRole',
        version: version,
        count: count,
      );

  /// Search for resources of type [T]. Prefer the other functions starting with
  /// `search` for specific resources.
  Future<Result<T>> search<T>(
    String baseUri, {
    required String resourceName,
    String version = 'baseR4',
    int? count,
  }) async =>
      switch (await getResource<T>(
        baseUri,
        '$version/$resourceName?${count != null ? '_count=$count' : ''}',
      )) {
        //Error
        (final OperationOutcome<T> o) => o,
        (final Bundle b)
            //Check all items are the correct type
            when b.entry != null &&
                !b.entry!.any((entry) => entry.resource is! T) =>
          BundleEntries<T>(
            b.entry
                    ?.map(
                      (entry) =>
                          //This is not very nice but we already checked
                          //for null and type above
                          entry.resource! as T,
                    )
                    .toList() ??
                [],
            b,
          ),
        //Unexpected Result
        (final Resource r) => OperationOutcome(
            text: Text(
              status: 'Unexpected Result',
              div: 'Expected a list of ${resourceName}s, but '
                  'got a ${r.resourceType}',
            ),
          ),
      };
}
