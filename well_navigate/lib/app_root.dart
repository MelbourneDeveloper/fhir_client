// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';
import 'package:well_navigate/main.dart';
import 'package:well_navigate/resource_editor.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF81B7A1)),
  fontFamily: 'Roboto',
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: const Color(0xFF81B7A1).withOpacity(0.5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: const Color(0xFF81B7A1).withOpacity(0.5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF4D8C7B)),
    ),
    labelStyle: TextStyle(color: const Color(0xFF81B7A1).withOpacity(0.8)),
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
