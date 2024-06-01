import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) => NavigationDrawer(
        onDestinationSelected: (index) async {
          switch (index) {
            case 0:
              break;
            case 1:
              await Navigator.pushNamed(context, '/patient');
            case 2:
              await Navigator.pushNamed(context, '/observation');
            case 3:
              await Navigator.pushNamed(context, '/medication');
            case 4:
              await Navigator.pushNamed(context, '/query');
            case 5:
              await Navigator.pushNamed(context, '/settings');
            case 6:
              await Navigator.pushNamed(context, '/about');
          }
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
