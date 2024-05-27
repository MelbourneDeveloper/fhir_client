import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    required this.headerTooltip,
    required this.headerText,
    required this.body,
    super.key,
  });

  final String headerTooltip;
  final String headerText;
  final Widget body;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Tooltip(
          message: headerTooltip,
          child: Text(
            headerText,
          ),
        ),
        subtitle: body,
      );
}
