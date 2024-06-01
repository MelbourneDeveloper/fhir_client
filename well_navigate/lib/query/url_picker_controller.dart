import 'package:flutter/material.dart';
import 'package:well_navigate/query/map_entry_controller.dart';

class UrlPickerController extends ChangeNotifier {
  final TextEditingController urlController =
      TextEditingController(text: 'https://hapi.fhir.org/baseR4/Appointment');
  final List<MapEntryController> headerControllers = [
    MapEntryController(key: 'Content-Type', value: 'application/json'),
  ];
  final List<MapEntryController> paramControllers = [
    MapEntryController(key: '_count', value: '10'),
  ];

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
