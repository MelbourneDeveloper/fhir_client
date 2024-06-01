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
  final UrlPickerController urlPickerController = UrlPickerController();

  Bundle? bundle;
  bool isLoading = false;
  Resource? queryResult;

  Future<void> makeRequest() async {
    isLoading = true;
    notifyListeners();

    try {
      final headers = <String, String>{
        for (final entry in urlPickerController.headerControllers)
          entry.keyController.text: entry.valueController.text,
      };
      final params = <String, String>{
        for (final entry in urlPickerController.paramControllers)
          entry.keyController.text: entry.valueController.text,
      };
      final url = Uri.parse(urlPickerController.urlController.text)
          .replace(queryParameters: params);
      final apiResponse = await client.get(
        url,
        headers: headers,
      );
      final jsonValueDecode2 = jsonValueDecode(apiResponse.body);
      queryResult = switch (jsonValueDecode2) {
        (final JsonObject json) => Resource.fromJson(json),
        _ => OperationOutcome<String>(
            text: Narrative(div: '<div>Error</div>'),
          )
      };
      // ignore: avoid_catches_without_on_clauses, empty_catches
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }
}
