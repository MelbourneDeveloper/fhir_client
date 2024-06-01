import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/mock_data.dart';
import 'package:well_navigate/resource_editor/resource_editor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                //TODO: runtime type is wrong here
                iconsByResourceType['Appointment'] ?? Icons.medical_services,
                size: 32,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Text(
                'Appointment',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
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
