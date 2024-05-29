import 'package:flutter/material.dart';
import 'package:well_navigate/query/query_notifier.dart';

final notifier = QueryNotifier();

class QueryPage extends StatelessWidget {
  const QueryPage({super.key});

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: notifier,
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: const Text('FHIR Server Query Tool'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: notifier.urlController,
                  decoration: const InputDecoration(
                    labelText: 'URL',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ...notifier.headerControllers.map((controller) {
                  final index = notifier.headerControllers.indexOf(controller);
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
                          onPressed: () => notifier.removeHeader(index),
                        ),
                      ],
                    ),
                  );
                }),
                ElevatedButton(
                  onPressed: notifier.addHeader,
                  child: const Text('Add Header'),
                ),
                const SizedBox(height: 16),
                ...notifier.paramControllers.map((controller) {
                  final index = notifier.paramControllers.indexOf(controller);
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
                          onPressed: () => notifier.removeParam(index),
                        ),
                      ],
                    ),
                  );
                }),
                ElevatedButton(
                  onPressed: notifier.addParam,
                  child: const Text('Add Parameter'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: notifier.makeRequest,
                  child: const Text('Send Request'),
                ),
                const SizedBox(height: 20),
                const Text('Response:'),
                SingleChildScrollView(
                  child: Text(notifier.response),
                ),
              ],
            ),
          ),
        ),
      );
}

class MapEntryController {
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();
}
