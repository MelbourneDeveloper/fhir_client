import 'package:fhir_client/models/narrative.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jayse/jayse.dart';
import 'package:well_navigate/query/url_picker_controller.dart';

class QueryNotifier extends ChangeNotifier {
  QueryNotifier({
    required this.client,
    this.isLoading = false,
  });

  final http.Client client;

  Bundle? bundle;
  bool isLoading = false;
  Resource? queryResult;

  Future<void> makeRequest(UriState uriState) async {
    isLoading = true;
    notifyListeners();

    try {
      final apiResponse = await client.get(
        uriState.uri,
        headers: uriState.headers,
      );
      //TODO: error handling. What happens when the status code is bad?
      //We need to use the actual extension methods make the calls...
      final jsonValueDecode2 = jsonValueDecode(apiResponse.body);
      queryResult = switch (jsonValueDecode2) {
        (final JsonObject json) => Resource.fromJson(json),
        _ => OperationOutcome<String>(
            text: Narrative(div: '<div>Error</div>'),
          )
      };
      // ignore: avoid_catches_without_on_clauses, empty_catches
    } catch (e) {
      queryResult = OperationOutcome<String>(
        text: Narrative(div: '<div>Error: $e</div>'),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
