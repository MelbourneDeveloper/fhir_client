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
              await Navigator.pushNamed(context, '/settings');
            case 2:
              await Navigator.pushNamed(context, '/about');
            case 3:
              await Navigator.pushNamed(context, '/query');
          }
        },
        children: <Widget>[
          const Padding(
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
            icon: Icon(iconsByResourceType['Appointment']),
            label: const Text('Appointment'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.info),
            label: Text('About'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.api),
            label: Text('API Query'),
          ),
        ],
      );
}
