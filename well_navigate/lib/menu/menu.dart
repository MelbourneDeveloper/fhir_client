import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:well_navigate/menu/menu_definition.dart';
import 'package:well_navigate/menu/menu_element.dart';
import 'package:well_navigate/menu/menu_state.dart';

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
      const SizedBox(height: 16),
    ];

/// The header for a group
Widget _groupHeader(String name) => Padding(
      padding: const EdgeInsets.fromLTRB(28, 24, 16, 8),
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
      MenuDivider() => [
          const Divider(
            height: 32,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
        ],
      MenuGroup(:final name, :final children) => _group(name, children),
    };

/// The menu widget
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: context<MenuState>().selectedIndex,
        builder: (context, selectedIndexNotifier, child) => NavigationDrawer(
          selectedIndex: selectedIndexNotifier,
          elevation: 2,
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          onDestinationSelected: (index) async {
            setState(() => context<MenuState>().selectedIndex.value = index);
            await Navigator.pushNamed(
              context,
              menuItems[index].routeName,
              arguments: menuItems[index].arguments,
            );
          },
          children: _menuElementWidgets,
        ),
      );
}
