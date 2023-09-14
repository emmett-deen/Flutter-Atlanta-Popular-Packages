import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class APIProvider {
  APIProvider({required this.host});

  final String host;
  final client = http.Client();

  /// Make a GET request to the API endpoint.
  Future<Response> get(String endpoint) async {
    return client.get(Uri.parse('$host$endpoint'));
  }
}
