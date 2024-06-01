import 'package:fhir_client/models/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:well_navigate/query/query_notifier.dart';

class QueryPage extends StatelessWidget {
  const QueryPage({super.key});

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: context<QueryNotifier>(),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: const Text('FHIR Server Query Tool'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
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
                  final index = context<QueryNotifier>()
                      .headerControllers
                      .indexOf(controller);
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
                  final index = context<QueryNotifier>()
                      .paramControllers
                      .indexOf(controller);
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: context<QueryNotifier>().makeRequest,
                  child: const Text('Send Request'),
                ),
                const SizedBox(height: 20),
                const Text('Response:'),
                SizedBox(
                  height: 500,
                  child: switch (context<QueryNotifier>()) {
                    QueryNotifier(isLoading: true) =>
                      const CircularProgressIndicator(),
                    _ => switch (context<QueryNotifier>().queryResult) {
                        (final OperationOutcome<dynamic> oo) =>
                          Text(oo.text?.div ?? ''),
                        (final Bundle bundle)
                            when bundle.entry?.isNotEmpty ?? false =>
                          ListView.builder(
                            itemBuilder: (context, index) => Text(
                              context<QueryNotifier>()
                                      .bundle
                                      ?.entry
                                      ?.length
                                      .toString() ??
                                  'No Entries',
                            ),
                          ),
                        _ => const Text('No results'),
                      }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
