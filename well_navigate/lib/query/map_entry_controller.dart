import 'package:flutter/material.dart';

class MapEntryController {
  MapEntryController({String? key, String? value}) {
    keyController.text = key ?? '';
    valueController.text = value ?? '';
  }

  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();
}
