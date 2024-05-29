import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/narrative.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';

const appTitle = 'Well Navigate';

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

const fieldDefinitionsByElementType = {
  'Appointment': Appointment.fieldDefinitions,
  'Meta': Meta.fieldDefinitions,
  'OperationOutcome': OperationOutcome.fieldDefinitions,
  'FieldDefinition<FixedList<Extension>>': Extension.fieldDefinitions,
  'FieldDefinition<Meta>': Meta.fieldDefinitions,
  'FieldDefinition<Narrative>': Narrative.fieldDefinitions,
};
