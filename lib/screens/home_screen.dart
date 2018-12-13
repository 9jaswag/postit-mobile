import 'package:flutter/material.dart';

import 'package:postit/shared/logo.dart';
import 'package:postit/shared/expanded_container_button.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // make the contents of the column stay in the center
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () => _navigateToLoginScreen(context),
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
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ExpandedContainerButton(
                      height: 50.0,
                      backgroundColor: Color(0xFF00BFA5),
                      borderRadius: 5.0,
                      text: "Sign Up",
                      fontSize: 20.0,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _navigateToLoginScreen(context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => LoginScreen(),
    // ));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }
}
