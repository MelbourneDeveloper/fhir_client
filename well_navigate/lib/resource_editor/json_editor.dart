import 'dart:convert';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/json.dart';

Map<String, TextStyle> getSyntaxTheme({
  ColorScheme? colorScheme,
  TextTheme? textTheme,
}) {
  final defaultTextStyle = TextStyle(
    backgroundColor: colorScheme?.surface ?? const Color(0xff23241f),
    color: textTheme?.bodyMedium?.color ?? const Color(0xfff8f8f2),
  );

  return {
    'root': defaultTextStyle,
    'tag': defaultTextStyle.copyWith(color: textTheme?.bodyMedium?.color),
    'subst': defaultTextStyle.copyWith(color: textTheme?.bodyMedium?.color),
    'strong': defaultTextStyle.copyWith(
      color: textTheme?.bodyMedium?.color,
      fontWeight: FontWeight.bold,
    ),
    'emphasis': defaultTextStyle.copyWith(
      color: textTheme?.bodyMedium?.color,
      fontStyle: FontStyle.italic,
    ),
    'bullet': defaultTextStyle.copyWith(color: colorScheme?.primary),
    'quote': defaultTextStyle.copyWith(color: colorScheme?.primary),
    'number': defaultTextStyle.copyWith(color: colorScheme?.primary),
    'number': defaultTextStyle.copyWith(color: colorScheme?.onSurface),
    'regexp': defaultTextStyle.copyWith(color: colorScheme?.primary),
    'literal': defaultTextStyle.copyWith(color: colorScheme?.onSurfaceVariant),
    'link': defaultTextStyle.copyWith(color: colorScheme?.primary),
    'code': defaultTextStyle.copyWith(color: colorScheme?.secondary),
    'title': defaultTextStyle.copyWith(color: colorScheme?.secondary),
    'section': defaultTextStyle.copyWith(color: colorScheme?.secondary),
    'selector-class': defaultTextStyle.copyWith(color: colorScheme?.secondary),
    'keyword': defaultTextStyle.copyWith(color: colorScheme?.error),
    'selector-tag': defaultTextStyle.copyWith(color: colorScheme?.error),
    'name': defaultTextStyle.copyWith(color: colorScheme?.error),
    'attr': defaultTextStyle.copyWith(color: colorScheme?.primary),
    'symbol': defaultTextStyle.copyWith(color: colorScheme?.tertiary),
    'attribute': defaultTextStyle.copyWith(color: colorScheme?.tertiary),
    'params': defaultTextStyle.copyWith(color: textTheme?.bodyMedium?.color),
    'string': defaultTextStyle.copyWith(color: colorScheme?.onSurface),
    'type': defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'built_in':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'builtin-name':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'selector-id':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'selector-attr':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'selector-pseudo':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'addition':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'variable':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'template-variable':
        defaultTextStyle.copyWith(color: colorScheme?.secondaryContainer),
    'comment': defaultTextStyle.copyWith(color: colorScheme?.onSurface),
    'deletion': defaultTextStyle.copyWith(color: colorScheme?.onSurface),
    'meta': defaultTextStyle.copyWith(color: colorScheme?.onSurface),
  };
}

class JsonEditor extends StatefulWidget {
  const JsonEditor({
    required this.initialJson,
    required this.onChanged,
    super.key,
  });

  final String initialJson;
  final void Function(String) onChanged;

  @override
  State<JsonEditor> createState() => _JsonEditorState();
}

class _JsonEditorState extends State<JsonEditor> {
  late final CodeController codeController;

  Map<String, TextStyle>? _theme;

  @override
  void initState() {
    super.initState();

    //TODO: Very inefficient.
    final jsonData = jsonDecode(widget.initialJson);
    final formattedJson = const JsonEncoder.withIndent('  ').convert(jsonData);

    codeController = CodeController(
      text: formattedJson,
      language: json,
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: better place to put this?
    _theme ??= getSyntaxTheme(
      colorScheme: Theme.of(context).colorScheme,
      textTheme: Theme.of(context).textTheme,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: CodeTheme(
        data: CodeThemeData(styles: _theme!),
        child: SingleChildScrollView(
          child: Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: const InputDecorationTheme(
                border: InputBorder.none,
              ),
            ),
            child: CodeField(
              onChanged: widget.onChanged,
              controller: codeController,
              textStyle: const TextStyle(fontFamily: 'Inconsolata'),
            ),
          ),
        ),
      ),
    );
  }
}
