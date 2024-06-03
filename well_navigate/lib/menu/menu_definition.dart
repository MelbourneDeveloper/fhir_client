import 'package:flutter/material.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/menu/menu_element.dart';
import 'package:well_navigate/query/query_page.dart';
import 'package:well_navigate/settings/settings_screen.dart';

/// The definitions for the menu
const menuElements = <MenuElement>[
  MenuItem(
    'About',
    Icons.info,
    routeName: AboutScreen.routeName,
    arguments: null,
  ),
  MenuItem(
    'Settings',
    Icons.settings,
    routeName: SettingsScreen.routeName,
    arguments: null,
  ),
  MenuDivider(),
  MenuGroup(
    [
      MenuItem(
        'Query',
        Icons.search,
        routeName: QueryPage.routeName,
        arguments: null,
      ),
      MenuItem(
        'Patients',
        Icons.person,
        routeName: QueryPage.routeName,
        arguments: '/Patient',
      ),
      MenuItem(
        'Appointments',
        Icons.calendar_today,
        routeName: QueryPage.routeName,
        arguments: '/Appointment',
      ),
    ],
    name: 'Queries',
  ),
];

/// The whole menu hierarchy flattened into a list of menu items
final menuItems = flattenMenuElements(menuElements);
