import 'dart:convert';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/text.dart';
import 'package:http/http.dart';

extension FhirExtensions on Client {
  Future<Resource> getResource(String baseUri, String path) async {
    try {
      final uri = '$baseUri$path';
      // ignore: avoid_print
      print(uri);
      final response = await this.get(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
      );

      try {
        final json = response.body;
        return Resource.fromJson(jsonDecode(json) as Map<String, dynamic>);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        return OperationOutcome(
          text: Text(
            status:
                'Exception or Error occurred when converting JSON to Resource',
            div: e.toString(),
          ),
        );
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return OperationOutcome(
        text: Text(
          status: 'Exception or Error occurred when contacting the FHIR server',
          div: e.toString(),
        ),
      );
    }
  }
}
