import 'package:flutter/material.dart';
import 'package:well_navigate/query/map_entry_controller.dart';

class UriState {
  UriState(this.uri, this.headers);

  final Uri uri;
  final Map<String, String> headers;
}

//TODO: not currently working properly

class UrlPickerController extends ValueNotifier<UriState> {
  // ignore: use_super_parameters
  UrlPickerController(UriState value) : super(value) {
    urlController = TextEditingController(text: value.uri.toString());

    urlController.addListener(_setValue);
  }

  //These are wrong. They should get the value from the UriState
  late final TextEditingController urlController;
  final List<MapEntryController> headerControllers = [
    MapEntryController(key: 'Content-Type', value: 'application/json'),
  ];
  final List<MapEntryController> paramControllers = [
    MapEntryController(key: '_count', value: '10'),
  ];

  void addHeader() {
    headerControllers.add(MapEntryController());
    _setValue();
  }

  void removeHeader(int index) {
    headerControllers.removeAt(index);
    _setValue();
  }

  void addParam() {
    paramControllers.add(MapEntryController());
    _setValue();
  }

  void removeParam(int index) {
    paramControllers.removeAt(index);
    _setValue();
  }

  void _setValue() {
    final headers = <String, String>{
      for (final entry in headerControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final params = <String, String>{
      for (final entry in paramControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final url = Uri.parse(urlController.text).replace(queryParameters: params);

    value = UriState(url, headers);
  }
}
