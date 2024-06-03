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
          borderRadius: standardCircularBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        // This centers the panel heading and the contents
        // Consider a breakpoint for desktop so fields align
        // to the left
        child: Column(
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
