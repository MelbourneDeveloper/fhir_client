import 'package:flutter/material.dart';
import 'package:well_navigate/ui_functions.dart';

class TextFieldFormatted extends StatelessWidget {
  const TextFieldFormatted({
    this.labelText,
    this.controller,
    this.onChanged,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? labelText;

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: standardInputDecoration(labelText),
      );
}
