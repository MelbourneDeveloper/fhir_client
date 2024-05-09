import 'dart:convert';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/resource_type.dart';
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
        return OperationOutcome<T>.error(
          message:
              'Exception or Error occurred when converting JSON to Resource',
          details: e.toString(),
        );
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return OperationOutcome<T>.error(
        message: 'Exception or Error occurred when contacting the FHIR server',
        details: e.toString(),
      );
    }
  }

  String? _queryString(List<MapEntry<String, String>>? parameters) =>
      parameters == null || parameters.isEmpty
          ? null
          : parameters
              .map(
                (entry) =>
                    //TODO: Url encode these
                    '${entry.key}=${entry.value}',
              )
              .join('&');

  /// Search for [Appointment]s
  Future<Result<Appointment>> searchAppointments(
    String baseUri, {
    String version = 'baseR4',
    int? count,
    String? status,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.appointment,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
          if (status != null) MapEntry('status', status),
        ]),
      );

  /// Search for [Encounter]s
  Future<Result<Encounter>> searchEncounters(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.encounter,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
        ]),
      );

  /// Search for [Observation]s
  Future<Result<Observation>> searchObservations(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.observation,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
        ]),
      );

  /// Search for [Patient]s
  Future<Result<Patient>> searchPatients(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.patient,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
        ]),
      );

  /// Search for [PractitionerRole]s
  Future<Result<PractitionerRole>> searchPractitionerRoles(
    String baseUri, {
    String version = 'baseR4',
    int? count,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.practitionerRole,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
        ]),
      );

  /// Search for [Schedule]s
  Future<Result<Schedule>> searchSchedules(
    String baseUri, {
    String version = 'baseR4',
    int? count,
    String? serviceType,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.schedule,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
          if (serviceType != null) MapEntry('service-type', serviceType),
        ]),
      );

  /// Search for [Slot]s
  Future<Result<Slot>> searchSlots(
    String baseUri, {
    String version = 'baseR4',
    int? count,
    String? status,
  }) async =>
      search(
        baseUri,
        resourceType: ResourceType.slot,
        version: version,
        queryString: _queryString([
          if (count != null) MapEntry('_count', count.toString()),
          if (status != null) MapEntry('status', status),
        ]),
      );

  /// Search for resources of type [T]. Prefer the other functions starting with
  /// `search` for specific resources.
  Future<Result<T>> search<T>(
    String baseUri, {
    required ResourceType resourceType,
    String version = 'baseR4',
    String? queryString,
  }) async =>
      switch (await getResource<T>(
        baseUri,
        '$version/${resourceType.code}${queryString != null ? '?$queryString' : ''}',
      )) {
        //Error
        (final OperationOutcome<T> o) => o,
        (final Bundle b)
            //Check all items are the correct type
            when b.entry is Defined<FixedList<Entry>> &&
                (b.entry as Defined<FixedList<Entry>>).value != null &&
                (b.entry as Defined<FixedList<Entry>>)
                    .value!
                    .every((entry) => entry.resource is T) =>
          BundleEntries<T>(
            (b.entry as Defined<FixedList<Entry>>)
                    .value
                    ?.map(
                      (entry) =>
                          //This is not very nice but we already checked
                          //for null and type above
                          entry.resource! as T,
                    )
                    .toFixedList() ??
                <T>[].toFixedList(),
            b,
          ),
        //Unexpected Result
        (final Resource r) => OperationOutcome.error(
            message: 'Unexpected Result',
            details: 'Expected a list of ${resourceType.code}s, but '
                'got a ${r.runtimeType}',
          ),
      };
}
