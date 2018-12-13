import 'package:flutter/material.dart';
import 'local_storage.dart';

void logout(BuildContext context) async {
  final localStorage = LocalStorage();
  localStorage.deleteToken('userToken');
  Navigator.of(context).pushReplacementNamed('/RootScreen');
}
