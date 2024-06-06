import 'package:flutter/material.dart';
import 'package:well_navigate/ui_functions.dart';

class FieldInputDecorator extends StatelessWidget {
  const FieldInputDecorator({
    required this.widget,
    super.key,
    this.labelText,
  });

  final Widget widget;
  final String? labelText;

  @override
  Widget build(BuildContext context) => InputDecorator(
        decoration: standardInputDecoration(labelText),
        child: widget,
      );
}
