import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = new FlutterSecureStorage();

  void storeToken(String key, String token) async {
    await storage.write(key: key, value: token);
  }

  Future<Map<String, String>> readAllTokens(String key) async {
    Map<String, String> value = await storage.readAll();
    return value;
  }

  Future<String> readToken(String key) async {
    String value = await storage.read(key: key);
    return value;
  }

  void deleteToken(String key) async {
    await storage.delete(key: key);
  }
}
