import 'package:fhir_client/validation/field_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:jayse/jayse.dart';
import 'package:well_navigate/resource_editor/field_input_decorator.dart';
import 'package:well_navigate/text_field_formatted.dart';

class HtmlEditor<T> extends StatefulWidget {
  const HtmlEditor({
    required this.element,
    required this.fieldDefinition,
    required this.onChanged,
    super.key,
  });

  final JsonObject element;
  final FieldDefinition<T> fieldDefinition;
  final ValueChanged<String> onChanged;

  @override
  State<HtmlEditor<T>> createState() => _HtmlEditorState<T>();
}

class _HtmlEditorState<T> extends State<HtmlEditor<T>> {
  bool _isEditing = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: switch (widget.fieldDefinition.getValue(widget.element)) {
        final String s => s,
        final num s => s.toString(),
        _ => '',
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onDoubleTap: _toggleEditing,
        child: _isEditing
            ? TextFieldFormatted(
                labelText: widget.fieldDefinition.display ??
                    widget.fieldDefinition.name,
                controller: _controller,
                onChanged: widget.onChanged,
              )
            : FieldInputDecorator(
                labelText: widget.fieldDefinition.display ??
                    widget.fieldDefinition.name,
                child: HtmlWidget(
                  widget.fieldDefinition.getValue(widget.element) as String? ??
                      '<div></div>',
                ),
              ),
      );
}
