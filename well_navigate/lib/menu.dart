import 'package:flutter/material.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/query/query_page.dart';
import 'package:well_navigate/settings/settings_screen.dart';

const destinations = <String,
    ({
  String routeName,
  Object? arguments,
})>{
  'patient': (
    routeName: QueryPage.routeName,
    arguments: '/Patient',
  ),
  'appointment': (
    routeName: QueryPage.routeName,
    arguments: '/Appointment',
  ),
  'query': (
    routeName: QueryPage.routeName,
    arguments: null,
  ),
  'settings': (
    routeName: SettingsScreen.routeName,
    arguments: null,
  ),

  'about': (
    routeName: AboutScreen.routeName,
    arguments: null,
  ),
  // 'observation': '/observation',
  // 'medication': '/medication',
};

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) => NavigationDrawer(
        onDestinationSelected: (index) async {
          final key = destinations.keys.elementAt(index);
          final destination = destinations[key]!;

          await switch (key) {
            'patient' || 'appointment' => Navigator.pushNamed(
                context,
                destination.routeName,
                arguments: destination.arguments,
              ),
            'observation' ||
            'medication' ||
            'query' ||
            'settings' ||
            'about' =>
              Navigator.pushNamed(context, destination.routeName),
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
            label: const Text('Patients'),
          ),
          NavigationDrawerDestination(
            icon: Icon(iconsByResourceType['Appointment']),
            label: const Text('Appointments'),
          ),
          // NavigationDrawerDestination(
          //   icon: Icon(iconsByResourceType['Observations']),
          //   label: const Text('Observation'),
          // ),
          // NavigationDrawerDestination(
          //   icon: Icon(iconsByResourceType['Medications']),
          //   label: const Text('Medication'),
          // ),
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
