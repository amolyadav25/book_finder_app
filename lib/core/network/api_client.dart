import 'dart:convert';

import 'package:http/http.dart' as http;


class ApiClient {

  Future<dynamic> getRequest(String query) async {
    final url = Uri.parse('https://openlibrary.org/search.json?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body;
    } else {
      throw Exception('Failed to Load Search');
    }
  }
}