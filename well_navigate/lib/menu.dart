import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) => NavigationDrawer(
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
      );
}
