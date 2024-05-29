import 'package:flutter/material.dart';

final colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 237, 172, 147));

final themeData = ThemeData(
  colorScheme: colorScheme,
  fontFamily: 'Roboto',
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.secondary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.secondary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.secondary),
    ),
  ),
  useMaterial3: true,
);

final iconsByResourceType = {'Appointment': Icons.event};
