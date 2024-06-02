import 'package:flutter/material.dart';

class TextFieldFormatted extends StatelessWidget {
  const TextFieldFormatted({
    required this.controller,
    required this.labelText,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) => TextField(
        style: const TextStyle().copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      );
}
