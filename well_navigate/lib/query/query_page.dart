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
  final TextEditingController _paramsController = TextEditingController();
  String _response = '';

  Future<void> _makeRequest() async {
    final url = Uri.parse('${_urlController.text}?${_paramsController.text}');
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
              TextField(
                controller: _paramsController,
                decoration: const InputDecoration(
                  labelText: 'Query Parameters',
                  border: OutlineInputBorder(),
                ),
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
