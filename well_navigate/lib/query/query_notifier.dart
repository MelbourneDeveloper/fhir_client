import 'package:fhir_client/models/narrative.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jayse/jayse.dart';
import 'package:well_navigate/query/map_entry_controller.dart';

class QueryNotifier extends ChangeNotifier {
  QueryNotifier({
    required this.client,
    this.isLoading = false,
  });

  final http.Client client;
  final TextEditingController urlController =
      TextEditingController(text: 'https://hapi.fhir.org/baseR4/Appointment');
  final List<MapEntryController> headerControllers = [
    MapEntryController(key: 'Content-Type', value: 'application/json'),
  ];
  final List<MapEntryController> paramControllers = [
    MapEntryController(key: '_count', value: '10'),
  ];

  Bundle? bundle;
  bool isLoading = false;
  Resource? queryResult;

  Future<void> makeRequest() async {
    isLoading = true;
    notifyListeners();
    try {
      final headers = <String, String>{
        for (final entry in headerControllers)
          entry.keyController.text: entry.valueController.text,
      };
      final params = <String, String>{
        for (final entry in paramControllers)
          entry.keyController.text: entry.valueController.text,
      };
      final url =
          Uri.parse(urlController.text).replace(queryParameters: params);

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

  void addHeader() {
    headerControllers.add(MapEntryController());
    notifyListeners();
  }

  void removeHeader(int index) {
    headerControllers.removeAt(index);
    notifyListeners();
  }

  void addParam() {
    paramControllers.add(MapEntryController());
    notifyListeners();
  }

  void removeParam(int index) {
    paramControllers.removeAt(index);
    notifyListeners();
  }
}
