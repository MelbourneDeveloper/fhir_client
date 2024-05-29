import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _headerController = TextEditingController();
  final List<MapEntryController> _paramControllers = [];
  String _response = '';

  Future<void> _makeRequest() async {
    final params = <String, String>{
      for (final entry in _paramControllers)
        entry.keyController.text: entry.valueController.text,
    };
    final url = Uri.parse(_urlController.text).replace(queryParameters: params);
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _headerController.text,
      },
    );
    setState(() {
      _response = response.body;
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
              const SizedBox(height: 8),
              TextField(
                controller: _headerController,
                decoration: const InputDecoration(
                  labelText: 'Authorization Header',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              ..._paramControllers.map((controller) {
                final index = _paramControllers.indexOf(controller);
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.keyController,
                        decoration: const InputDecoration(
                          labelText: 'Key',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: controller.valueController,
                        decoration: const InputDecoration(
                          labelText: 'Value',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => _removeParam(index),
                    ),
                  ],
                );
              }),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: _addParam,
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
