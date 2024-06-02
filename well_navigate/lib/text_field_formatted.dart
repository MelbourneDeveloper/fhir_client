import 'package:flutter/material.dart';

class TextFieldFormatted extends StatelessWidget {
  const TextFieldFormatted({
    required this.labelText,
    this.controller,
    this.onChanged,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) => TextField(
        style: const TextStyle().copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      );
}
