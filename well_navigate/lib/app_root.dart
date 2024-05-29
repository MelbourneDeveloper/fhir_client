// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/main.dart';
import 'package:well_navigate/resource_editor/resource_editor.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Well Navigator',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Well Navigator'),
          ),
          body: ResourceEditor(
            resourceRoot: appointment.json,
            resourceTypeName: 'Appointment',
          ),
          drawer: NavigationDrawer(
            onDestinationSelected: (index) {},
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
            ],
          ),
        ),
      );
}
