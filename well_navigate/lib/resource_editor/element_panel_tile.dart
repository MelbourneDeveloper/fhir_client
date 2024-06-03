import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';

/// A tile that displays a header and content for a given
/// element on a resource, or details of the resource
class ElementPanelTile extends StatelessWidget {
  const ElementPanelTile({
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
        padding: standardPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
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
            const SizedBox(height: 32),
            Tooltip(
              message: headerTooltip,
              child: Text(
                headerText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            standardVerticalSpacer,
            body,
          ],
        ),
      );
}
