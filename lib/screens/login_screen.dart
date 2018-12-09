import 'package:flutter/material.dart';

import 'package:postit/shared/stacked_logo.dart';
import 'package:postit/shared/expanded_container_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xFF00bfa5)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            StackedLogo(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('POSTIT', style: TextStyle(fontSize: 30.0))
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password')),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 60.0),
                    child: ExpandedContainerButton(
                      height: 50.0,
                      backgroundColor: Color(0xFF00BFA5),
                      borderRadius: 5.0,
                      text: "Login",
                      fontSize: 20.0,
                      textColor: Colors.white,
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
                      textColor: Color(0xFF00BFA5),
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
                      style: TextStyle(fontSize: 20.0, color: Color(0xFF00BFA5)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
