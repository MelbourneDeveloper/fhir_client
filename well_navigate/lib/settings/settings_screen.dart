import 'package:flutter/material.dart';
import 'package:well_navigate/settings/settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controller = SettingsController();
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, settings, child) => Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: settings?.isDarkMode ?? false,
                onChanged: (_) async => controller.toggleDarkMode(),
              ),
              ListTile(
                title: const Text('Base URI'),
                subtitle: Text(settings?.baseUri.toString() ?? ''),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
