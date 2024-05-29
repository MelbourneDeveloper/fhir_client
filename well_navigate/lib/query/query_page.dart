import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  final TextEditingController _urlController = TextEditingController();
  final List<MapEntryController> _headerControllers = [];
  final List<MapEntryController> _paramControllers = [];
  String _response = '';

  Future<void> _makeRequest() async {
    final headers = <String, String>{
      for (final entry in _headerControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final params = <String, String>{
      for (final entry in _paramControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final url = Uri.parse(_urlController.text).replace(queryParameters: params);
    final response = await http.get(
      url,
      headers: headers,
    );
    setState(() {
      _response = response.body;
    });
  }

  void _addHeader() {
    setState(() {
      _headerControllers.add(MapEntryController());
    });
  }

  void _removeHeader(int index) {
    setState(() {
      _headerControllers.removeAt(index);
    });
  }

  void _addParam() {
    setState(() {
      _paramControllers.add(MapEntryController());
    });
  }

  void _removeParam(int index) {
    setState(() {
      _paramControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('FHIR Server Query Tool'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  labelText: 'URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ..._headerControllers.map((controller) {
                final index = _headerControllers.indexOf(controller);
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
                        onPressed: () => _removeHeader(index),
                      ),
                    ],
                  ),
                );
              }),
              ElevatedButton(
                onPressed: _addHeader,
                child: const Text('Add Header'),
              ),
              const SizedBox(height: 16),
              ..._paramControllers.map((controller) {
                final index = _paramControllers.indexOf(controller);
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
                        onPressed: () => _removeParam(index),
                      ),
                    ],
                  ),
                );
              }),
              ElevatedButton(
                onPressed: _addParam,
                child: const Text('Add Parameter'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _makeRequest,
                child: const Text('Send Request'),
              ),
              const SizedBox(height: 20),
              const Text('Response:'),
              SingleChildScrollView(
                child: Text(_response),
              ),
            ],
          ),
        ),
      );
}

class MapEntryController {
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();
}
