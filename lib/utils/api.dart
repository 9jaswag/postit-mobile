import 'dart:async';
import 'dart:convert' show json, utf8;
import 'package:http/http.dart' as http; // requires dart:io to work

/// The REST API retrieves data from the hosted PostIT endpoint
class Api {
  // final HttpClient _httpClient = HttpClient();
  final String _url = 'https://postiit.herokuapp.com';

  /// Returns a user's detail.
  ///
  /// Returns null if the API server is down, or the response is not JSON.
  Future<Map> signIn(username, password) async {
    final url = '$_url/api/v1/user/signin';
    final body = {'username': username, 'password': password};
    final response = await _postJson(url, body);
    return response;
  }

  /// Fetches and returns a JSON object represented as a Dart [String].
  ///
  /// Returns null if the API server is down, or the response is not JSON.
  Future<Map> _postJson(String url, Map<String, dynamic> body) async {
    try {
      var response = await http.post(url, body: body);
      return json.decode(response.body);
      // possible if/else for status code and show dialog for failed login
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
