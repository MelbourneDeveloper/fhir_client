import 'package:flutter/material.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/query/query_page.dart';
import 'package:well_navigate/settings/settings_screen.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) => NavigationDrawer(
        onDestinationSelected: (index) async {
          await switch (index) {
            0 => null,
            1 => Navigator.pushNamed(context, '/patient'),
            2 => Navigator.pushNamed(context, '/observation'),
            3 => Navigator.pushNamed(context, '/medication'),
            4 => Navigator.pushNamed(context, QueryPage.routeName),
            5 => Navigator.pushNamed(context, SettingsScreen.routeName),
            6 => Navigator.pushNamed(context, AboutScreen.routeName),
            _ => null,
          };
        },
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'FHIR Resources',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(iconsByResourceType['Patient']),
            label: const Text('Patient'),
          ),
          NavigationDrawerDestination(
            icon: Icon(iconsByResourceType['Appointment']),
            label: const Text('Appointment'),
          ),
          NavigationDrawerDestination(
            icon: Icon(iconsByResourceType['Observation']),
            label: const Text('Observation'),
          ),
          NavigationDrawerDestination(
            icon: Icon(iconsByResourceType['Medication']),
            label: const Text('Medication'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Tools',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.search),
            label: Text('Query'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.info),
            label: Text('About'),
          ),
        ],
      );
}
