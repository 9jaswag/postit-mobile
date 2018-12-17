import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as http; // requires dart:io to work

import 'package:postit/utils/local_storage.dart';

/// The REST API retrieves data from the hosted PostIT endpoint
class Api {
  final String _url = 'https://postiit.herokuapp.com';
  final localStorage = LocalStorage();

  Future<String> getUserToken() async {
    var userToken = await localStorage.readToken('userToken');
    return userToken;
  }

  /// Returns a user's detail.
  ///
  /// Returns null if the API server is down, or the response is not JSON.
  Future<Map> signIn(username, password) async {
    final url = '$_url/api/v1/user/signin';
    final body = {'username': username, 'password': password};
    final response = await _postJson(url, body);
    return response;
  }

  Future<Map> fetchUserGroups() async {
    final url = '$_url/api/v1/user/group';
    var token = await getUserToken();
    final headers = {'x-access-token': token, 'Accept': 'text/plain'};
    final response = await _getJson(url, headers);
    return response;
  }

  Future<Map> fetchGroupMessage(id) async {
    final url = '$_url/api/v1/group/$id/messages';
    var token = await getUserToken();
    final headers = {'x-access-token': token, 'Accept': 'text/plain'};
    final response = await _getJson(url, headers);
    return response;
  }

  Future<Map> findUsers({username = '', limit = 5, offset = 0}) async {
    final url =
        '$_url/api/v1/user/search?username=$username&limit=$limit&offset=$offset';
    var token = await getUserToken();
    final headers = {'x-access-token': token, 'Accept': 'text/plain'};
    final response = await _getJson(url, headers);
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

  Future<Map> _getJson(String url, Map<String, dynamic> headers) async {
    try {
      var response = await http.get(url, headers: headers);
      return json.decode(response.body);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
