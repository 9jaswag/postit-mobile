import 'package:flutter/material.dart';

import 'package:postit/utils/local_storage.dart';
import 'package:postit/utils/parse_jwt.dart';
import 'tab_screen.dart';
import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  String _token;

  @override
  void initState() {
    super.initState();
    _isAuthenticated();
  }

  void _isAuthenticated() async {
    final localStorage = LocalStorage();
    var userToken = await localStorage.readToken('userToken');
    if (userToken != null) {
      Map<String, dynamic> decodedToken = parseJwt(userToken);
      localStorage.storeToken('userId', decodedToken['id'].toString());
      localStorage.storeToken('userEmail', decodedToken['email']);
      localStorage.storeToken('userName', decodedToken['username']);
      setState(() {
        _token = userToken;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_token != null) {
      return Container(
        child: TabScreen(),
      );
    } else {
      return Container(
        child: HomeScreen(),
      );
    }
  }
}
