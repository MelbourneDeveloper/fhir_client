import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:well_navigate/settings/settings_controller.dart';
import 'package:well_navigate/text_field_formatted.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: context<SettingsController>(),
        builder: (context, settings, child) => Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: settings?.isDarkMode ?? false,
                  onChanged: (_) async =>
                      context<SettingsController>().toggleDarkMode(),
                ),
                ListTile(
                  title: const Text('Base Url'),
                  subtitle: TextFieldFormatted(
                    controller: context<SettingsController>().baseUriController,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
