import 'package:flutter/material.dart';
import 'package:well_navigate/about_screen.dart';
import 'package:well_navigate/query/query_page.dart';
import 'package:well_navigate/settings/settings_screen.dart';

/// An element in the menu
sealed class MenuElement {
  const MenuElement();
}

/// A group of menu elements so elements can be organized
/// into a hierarchy
final class MenuGroup extends MenuElement {
  const MenuGroup(this.children, {required this.name});

  final String name;
  final List<MenuElement> children;
}

/// A menu item that navigates to a route
final class MenuItem extends MenuElement {
  const MenuItem(
    this.name,
    this.icon, {
    required this.routeName,
    required this.arguments,
  }) : super();

  final String routeName;
  final Object? arguments;
  final String name;
  final IconData icon;
}

/// A divider in the menu
final class MenuDivider extends MenuElement {
  const MenuDivider() : super();
}

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

List<MenuItem> _flattenMenuElements(List<MenuElement> elements) =>
    elements.expand<MenuItem>((element) {
      if (element is MenuGroup) {
        return _flattenMenuElements(element.children);
      } else if (element is MenuItem) {
        return [element];
      } else {
        return [];
      }
    }).toList();

final menuItems = _flattenMenuElements(menuElements);

/// Currently just a list of widgets, but this might become a function
/// later if the menu needs to be built dynamically
final _menuElementWidgets = _elementsToWidgets(menuElements);

List<Widget> _elementsToWidgets(List<MenuElement> elements) =>
    elements.map(_elementToWidgets).expand((e) => e).toList();

List<Widget> _group(String name, List<MenuElement> children) => [
      _groupHeader(name),
      ..._elementsToWidgets(children),
    ];

Padding _groupHeader(String name) => Padding(
      padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

List<Widget> _elementToWidgets(MenuElement child) => switch (child) {
      final MenuItem mi => [
          NavigationDrawerDestination(
            icon: Icon(
              mi.icon,
            ),
            label: Text(
              mi.name,
            ),
          ),
        ],
      MenuDivider() => [const Divider()],
      MenuGroup(:final name, :final children) => _group(name, children),
    };

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) => NavigationDrawer(
        selectedIndex: _selectedIndex,
        tilePadding: const EdgeInsets.all(4),
        onDestinationSelected: (index) async {
          setState(() => _selectedIndex = index);
          await Navigator.pushNamed(
            context,
            menuItems[index].routeName,
            arguments: menuItems[index].arguments,
          );
        },
        children: _menuElementWidgets,
      );
}
