import 'dart:convert';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/json.dart';

class JsonEditor extends StatefulWidget {
  const JsonEditor({
    required this.initialJson,
    super.key,
  });

  final String initialJson;

  @override
  State<JsonEditor> createState() => _JsonEditorState();
}

class _JsonEditorState extends State<JsonEditor> {
  late final CodeController codeController;

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
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: CodeTheme(
          data: const CodeThemeData(styles: monokaiSublimeTheme),
          child: SingleChildScrollView(
            child: CodeField(
              onChanged: (c) {},
              controller: codeController,
              textStyle: const TextStyle(fontFamily: 'Inconsolata'),
            ),
          ),
        ),
      );
}
