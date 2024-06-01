import 'package:flutter/material.dart';
import 'package:well_navigate/query/url_picker_controller.dart';

//TODO: not currently working properly

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
            TextField(
              controller: controller.urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
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
                      child: TextField(
                        controller: mapEntryController.keyController,
                        decoration: const InputDecoration(
                          labelText: 'Header Key',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: mapEntryController.valueController,
                        decoration: const InputDecoration(
                          labelText: 'Header Value',
                          border: OutlineInputBorder(),
                        ),
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
                      child: TextField(
                        controller: mapEntryController.keyController,
                        decoration: const InputDecoration(
                          labelText: 'Parameter Key',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: mapEntryController.valueController,
                        decoration: const InputDecoration(
                          labelText: 'Parameter Value',
                          border: OutlineInputBorder(),
                        ),
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
