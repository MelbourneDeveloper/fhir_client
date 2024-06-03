import 'package:flutter/material.dart';
import 'package:well_navigate/menu/menu_definition.dart';
import 'package:well_navigate/menu/menu_element.dart';

/// Currently just a list of widgets, but this might become a function
/// later if the menu needs to be built dynamically
final _menuElementWidgets = _elementsToWidgets(menuElements);

/// Converts a list of menu elements into a list of widgets
List<Widget> _elementsToWidgets(List<MenuElement> elements) =>
    elements.map(_elementToWidgets).expand((e) => e).toList();

/// Converts a menu element into a list of widgets
List<Widget> _group(String name, List<MenuElement> children) => [
      _groupHeader(name),
      ..._elementsToWidgets(children),
    ];

/// The header for a group
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

/// Converts a menu element into a list of widgets
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

/// The menu widget
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
