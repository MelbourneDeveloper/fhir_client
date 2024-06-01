import 'package:flutter/material.dart';
import 'package:well_navigate/constants.dart';
import 'package:well_navigate/main_app_bar.dart';
import 'package:well_navigate/menu.dart';
import 'package:well_navigate/mock_data.dart';
import 'package:well_navigate/resource_editor/resource_editor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: mainAppBar(
          'Appointment',
          iconsByResourceType['Appointment'] ?? Icons.medical_services,
          context,
        ),
        body: ResourceEditor(
          resourceRoot: appointment.json,
          resourceTypeName: 'Appointment',
        ),
        drawer: const Menu(),
      );
}
