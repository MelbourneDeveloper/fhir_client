import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:well_navigate/query/query_page.dart';

class QueryNotifier extends ChangeNotifier {
  QueryNotifier({required this.client});

  final http.Client client;
  final TextEditingController urlController = TextEditingController();
  final List<MapEntryController> headerControllers = [];
  final List<MapEntryController> paramControllers = [];
  String response = '';

  Future<void> makeRequest() async {
    final headers = <String, String>{
      for (final entry in headerControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final params = <String, String>{
      for (final entry in paramControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final url = Uri.parse(urlController.text).replace(queryParameters: params);
    final apiResponse = await client.get(
      url,
      headers: headers,
    );
    response = apiResponse.body;
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
