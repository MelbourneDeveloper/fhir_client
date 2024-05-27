// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';
import 'package:well_navigate/main.dart';
import 'package:well_navigate/resource_editor.dart';

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

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Well Navigator',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: Scaffold(
          body: ResourceEditor(
            resource: appointment,
          ),
        ),
      );
}
