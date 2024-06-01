import 'package:flutter/material.dart';
import 'package:well_navigate/main_app_bar.dart';
import 'package:well_navigate/menu.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    required this.title,
    required this.icon,
    required this.body,
    super.key,
  });

  final String title;
  final IconData icon;
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: mainAppBar(
          title,
          icon,
          context,
        ),
        body: body,
        drawer: const Menu(),
      );
}
