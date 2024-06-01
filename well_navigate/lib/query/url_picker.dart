import 'package:flutter/material.dart';
import 'package:well_navigate/query/query_notifier.dart';

class UrlPicker extends StatelessWidget {
  const UrlPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TextField(
            controller: context<QueryNotifier>().urlController,
            decoration: const InputDecoration(
              labelText: 'URL',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ...context<QueryNotifier>().headerControllers.map((controller) {
            final index =
                context<QueryNotifier>().headerControllers.indexOf(controller);
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.keyController,
                      decoration: const InputDecoration(
                        labelText: 'Header Key',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controller.valueController,
                      decoration: const InputDecoration(
                        labelText: 'Header Value',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () =>
                        context<QueryNotifier>().removeHeader(index),
                  ),
                ],
              ),
            );
          }),
          ElevatedButton(
            onPressed: context<QueryNotifier>().addHeader,
            child: const Text('Add Header'),
          ),
          const SizedBox(height: 16),
          ...context<QueryNotifier>().paramControllers.map((controller) {
            final index =
                context<QueryNotifier>().paramControllers.indexOf(controller);
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.keyController,
                      decoration: const InputDecoration(
                        labelText: 'Parameter Key',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controller.valueController,
                      decoration: const InputDecoration(
                        labelText: 'Parameter Value',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () =>
                        context<QueryNotifier>().removeParam(index),
                  ),
                ],
              ),
            );
          }),
          ElevatedButton(
            onPressed: context<QueryNotifier>().addParam,
            child: const Text('Add Parameter'),
          ),
        ],
      );
}
