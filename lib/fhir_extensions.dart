import 'package:http/http.dart';

extension FhirExtensions on Client {
  Future<String> getResource(String baseUri, String path) async {
    final response = await this.get(
      Uri.parse('$baseUri$path'),
      headers: {'Content-Type': 'application/json'},
    );

    final json = response.body;
    return json;
  }
}
