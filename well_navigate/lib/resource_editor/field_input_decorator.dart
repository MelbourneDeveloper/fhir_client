import 'package:flutter/material.dart';
import 'package:well_navigate/ui_functions.dart';

class FieldInputDecorator extends StatelessWidget {
  const FieldInputDecorator({
    required this.child,
    super.key,
    this.labelText,
  });

  final Widget child;
  final String? labelText;

  @override
  Widget build(BuildContext context) => InputDecorator(
        decoration: standardInputDecoration(labelText),
        child: child,
      );
}
