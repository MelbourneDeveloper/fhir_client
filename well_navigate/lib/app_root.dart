
import 'package:flutter/material.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/main.dart';
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
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/about': (context) => const AboutScreen(),
          '/query': (context) => const QueryPage(),
        },
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: ResourceEditor(
          resourceRoot: appointment.json,
          resourceTypeName: 'Appointment',
        ),
        drawer: NavigationDrawer(
          onDestinationSelected: (index) async {
            switch (index) {
              case 0:
                await Navigator.pushNamed(context, '/');
              case 1:
                await Navigator.pushNamed(context, '/settings');
              case 2:
                await Navigator.pushNamed(context, '/about');
              case 3:
                await Navigator.pushNamed(context, '/query');
            }
          },
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.info),
              label: Text('About'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.api),
              label: Text('API Query'),
            ),
          ],
        ),
      );
}
