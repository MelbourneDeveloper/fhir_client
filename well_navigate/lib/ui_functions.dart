import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';

InputDecoration standardInputDecoration(String? labelText) => InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
    );

BoxDecoration standardFieldBoxDecoration(BuildContext context) => BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.outlineVariant,
      ),
      borderRadius: standardCircularBorderRadius,
    );
