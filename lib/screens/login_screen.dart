import 'dart:async';

import 'package:flutter/material.dart';

import 'package:postit/shared/logo.dart';
import 'package:postit/shared/expanded_container_button.dart';
import 'package:postit/utils/api.dart';
import 'package:postit/utils/local_storage.dart';
import 'package:postit/shared/display_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String userToken;

  // getters for username and password value
  // String get username => _usernameController.text;
  // String get password => _passwordController.text;

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInUser() async {
    final api = Api();
    final localStorage = LocalStorage();
    final userDetail = await api.signIn(
        _usernameController.text.trim(), _passwordController.text.trim());
    if (userDetail != null) {
      if (userDetail['success']) {
        localStorage.storeToken('userToken', userDetail['token']);
        Navigator.of(context).pushReplacementNamed('/TabScreen');
      } else {
        displayDialog(
            context,
            'Error',
            'Login failed. Ensure your details are correct and try again!',
            'Close');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password')),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 60.0),
                    child: GestureDetector(
                      onTap: () => _signInUser(),
                      child: ExpandedContainerButton(
                        height: 50.0,
                        backgroundColor: Theme.of(context).primaryColor,
                        borderRadius: 5.0,
                        text: "Login",
                        fontSize: 20.0,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 60.0),
                    child: ExpandedContainerButton(
                      height: 50.0,
                      backgroundColor: Colors.transparent,
                      borderRadius: 5.0,
                      text: "Forgot Password?",
                      fontSize: 20.0,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text(
                      'Create a new account.',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding:
          false, // removes the overflow issue on the input field:active
    );
  }
}
