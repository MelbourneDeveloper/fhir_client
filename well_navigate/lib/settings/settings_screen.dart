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
  final _controller = SettingsController();

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, settings, child) => Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: settings?.isDarkMode ?? false,
                    onChanged: (_) async => _controller.toggleDarkMode(),
                  ),
                  ListTile(
                    title: const Text('Base Url'),
                    subtitle:
                        TextField(controller: _controller.baseUriController),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
