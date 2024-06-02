import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_navigate/settings/settings.dart';

class SettingsController extends ValueNotifier<Settings?> {
  // ignore: use_super_parameters
  SettingsController() : super(null) {
    baseUriController.addListener(_onUrlChanged);

    unawaited(_loadSettings());
  }
  
  TextEditingController baseUriController = TextEditingController();

  void _onUrlChanged() {
    //ignore: avoid_print
    print('sdf');
    final newUri = Uri.tryParse(baseUriController.text);
    if (newUri != null) {
      unawaited(updateBaseUri(newUri));
    }
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('settings');

    final jsonValue = json != null ? jsonValueDecode(json) : null;

    value = switch (jsonValue) {
      (final JsonObject jo) => Settings.fromJson(jo),
      _ => Settings(),
    };

    baseUriController.text = value?.baseUri.toString() ?? '';
  }

  Future<void> updateBaseUri(Uri newUri) async {
    value = value?.copyWith(baseUri: newUri);
    unawaited(_saveSettings());
  }

  Future<void> toggleDarkMode() async {
    value = value?.copyWith(isDarkMode: !(value?.isDarkMode ?? false));
    unawaited(_saveSettings());
  }

  Future<void> _saveSettings() async {
    if (value == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('settings', jsonValueEncode(value!.json));
  }
}
