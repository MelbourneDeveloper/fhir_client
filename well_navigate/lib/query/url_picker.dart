import 'package:flutter/material.dart';
import 'package:well_navigate/query/url_picker_controller.dart';
import 'package:well_navigate/text_field_formatted.dart';

class UrlPicker extends StatefulWidget {
  const UrlPicker({
    required this.onChanged,
    required this.uriState,
    super.key,
  });

  final UriState uriState;
  final void Function(UriState) onChanged;

  @override
  State<UrlPicker> createState() => _UrlPickerState();
}

class _UrlPickerState extends State<UrlPicker> {
  late final UrlPickerController controller;

  @override
  void initState() {
    super.initState();
    controller = UrlPickerController(widget.uriState)
      ..addListener(() => widget.onChanged(controller.value));
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: controller,
        builder: (context, child) => Column(
          children: <Widget>[
            TextFieldFormatted(
              controller: controller.urlController,
              labelText: 'URL',
            ),
            const SizedBox(height: 16),
            ...controller.headerControllers.map((mapEntryController) {
              final index =
                  controller.headerControllers.indexOf(mapEntryController);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldFormatted(
                        controller: mapEntryController.keyController,
                        labelText: 'Header Key',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFieldFormatted(
                        labelText: 'Header Value',
                        controller: mapEntryController.valueController,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => controller.removeHeader(index),
                    ),
                  ],
                ),
              );
            }),
            ElevatedButton(
              onPressed: controller.addHeader,
              child: const Text('Add Header'),
            ),
            const SizedBox(height: 16),
            ...controller.paramControllers.map((mapEntryController) {
              final index =
                  controller.paramControllers.indexOf(mapEntryController);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldFormatted(
                        controller: mapEntryController.keyController,
                        labelText: 'Parameter Key',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFieldFormatted(
                        controller: mapEntryController.valueController,
                        labelText: 'Parameter Value',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => controller.removeParam(index),
                    ),
                  ],
                ),
              );
            }),
            ElevatedButton(
              onPressed: controller.addParam,
              child: const Text('Add Parameter'),
            ),
          ],
        ),
      );
}
