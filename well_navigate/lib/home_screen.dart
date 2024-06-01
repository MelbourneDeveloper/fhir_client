import 'package:flutter/material.dart';
import 'package:well_navigate/mock_data.dart';
import 'package:well_navigate/resource_editor/resource_editor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => ResourceEditor(
        resourceRoot: appointment.json,
        resourceTypeName: 'Appointment',
      );
}
