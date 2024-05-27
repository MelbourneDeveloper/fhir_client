// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';
import 'package:well_navigate/main.dart';
import 'package:well_navigate/resource_editor.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Well Navigator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: ResourceEditor(
            resource: appointment,
          ),
        ),
      );
}
