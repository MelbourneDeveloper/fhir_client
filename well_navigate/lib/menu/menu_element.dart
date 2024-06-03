import 'package:flutter/material.dart';

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

/// Flattens the menu elements into a list of menu items
List<MenuItem> flattenMenuElements(List<MenuElement> elements) => elements
    .expand<MenuItem>(
      (element) => switch (element) {
        MenuGroup(:final children) => flattenMenuElements(children),
        final MenuItem mi => [mi],
        _ => [],
      },
    )
    .toList();
