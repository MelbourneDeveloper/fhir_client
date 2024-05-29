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
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tooltip(
              message: headerTooltip,
              child: Text(
                headerText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyMedium!,
              child: body,
            ),
          ],
        ),
      );
}
