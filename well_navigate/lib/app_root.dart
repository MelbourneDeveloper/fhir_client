import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/main_scaffold.dart';
import 'package:well_navigate/query/query_page.dart';
import 'package:well_navigate/resource_editor/resource_editor.dart';
import 'package:well_navigate/settings/settings_controller.dart';
import 'package:well_navigate/settings/settings_screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: context<SettingsController>(),
        builder: (context, settings, child) => MaterialApp(
          title: appTitle,
          debugShowCheckedModeBanner: false,
          theme: settings?.isDarkMode ?? false ? darkThemeData : themeData,
          initialRoute: '/query',
          routes: {
            '/settings': (context) => const MainScaffold(
                  title: 'Settings',
                  icon: Icons.settings,
                  body: SettingsScreen(),
                ),
            '/about': (context) => const MainScaffold(
                  title: 'About',
                  icon: Icons.info,
                  body: AboutScreen(),
                ),
            '/query': (context) => const MainScaffold(
                  title: 'Query',
                  icon: Icons.search,
                  body: QueryPage(),
                ),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/resource') {
              final json = settings.arguments! as String;

              //TODO: handle not an object
              final jsonValue = jsonValueDecode(json) as JsonObject;

              //TODO: handle no resourceType
              final resourceType = jsonValue['resourceType'].stringValue!;

              return MaterialPageRoute(
                builder: (context) => MainScaffold(
                  title: resourceType,
                  icon: iconsByResourceType[resourceType] ??
                      Icons.medical_services,
                  body: ResourceEditor(
                    resourceRoot: jsonValue,
                    resourceTypeName: resourceType,
                  ),
                ),
              );
            }
            return null;
          },
        ),
      );
}
