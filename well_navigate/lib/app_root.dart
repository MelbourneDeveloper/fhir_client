import 'package:flutter/material.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/main_scaffold.dart';
import 'package:well_navigate/query/query_page.dart';
import 'package:well_navigate/resource_editor/resource_editor.dart';
import 'package:well_navigate/settings_screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: '/query',
        routes: {
          '/resource': (context) => MainScaffold(
                title: 'Appointment',
                icon: iconsByResourceType['Appointment'] ??
                    Icons.medical_services,
                body: ResourceEditor(
                  resourceRoot: jsonValueDecode(
                    ModalRoute.of(context)!.settings.arguments! as String,
                  ) as JsonObject,
                  resourceTypeName: 'Appointment',
                ),
              ),
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
      );
}
