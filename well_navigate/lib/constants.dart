import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/narrative.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';

const appTitle = 'Well Navigate';

final colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 237, 172, 147));

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 237, 172, 147),
  brightness: Brightness.dark,
);

final themeData = ThemeData(
  colorScheme: colorScheme,
  fontFamily: 'Roboto',
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: colorScheme.primary),
    border: OutlineInputBorder(
      borderRadius: standardCircularBorderRadius,
      borderSide: BorderSide(color: colorScheme.secondary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: standardCircularBorderRadius,
      borderSide: BorderSide(color: colorScheme.secondary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: standardCircularBorderRadius,
      borderSide: BorderSide(color: colorScheme.secondary),
    ),
  ),
  useMaterial3: true,
);

final darkThemeData = themeData.copyWith(
  colorScheme: darkColorScheme,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: darkColorScheme.onSurface),
    bodySmall: TextStyle(color: darkColorScheme.onSurface),
    titleMedium: TextStyle(color: darkColorScheme.primary),
  ),
  brightness: Brightness.dark,
);

final iconsByResourceType = {
  'Appointment': Icons.event,
  'Patient': Icons.person,
};

const fieldDefinitionsByElementType = {
  'Appointment': Appointment.fieldDefinitions,
  'Patient': Patient.fieldDefinitions,
  'Meta': Meta.fieldDefinitions,
  'OperationOutcome': OperationOutcome.fieldDefinitions,
  'FieldDefinition<FixedList<Extension>>': Extension.fieldDefinitions,
  'FieldDefinition<Meta>': Meta.fieldDefinitions,
  'FieldDefinition<Narrative>': Narrative.fieldDefinitions,
};

const standardPaddingValue = 16.0;

const standardHorizontalSpacer = SizedBox(
  width: standardPaddingValue,
);

const standardHorizontalPadding = EdgeInsets.only(
  left: standardPaddingValue,
  right: standardPaddingValue,
);

const standardPadding = EdgeInsets.all(standardPaddingValue);

const standardVerticalSpacer = SizedBox(height: standardPaddingValue);
const halfSizedVerticalSpacer = SizedBox(height: 8);

final standardCircularBorderRadius = BorderRadius.circular(8);
