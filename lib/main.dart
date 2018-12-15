import 'package:flutter/material.dart';

import 'screens/root_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tab_screen.dart';

void main() => runApp(PostIt());

class PostIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PostIT',
      routes: <String, WidgetBuilder>{
        "/RootScreen": (BuildContext context) => RootScreen(),
        "/TabScreen": (BuildContext context) => TabScreen(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF36558F),
        fontFamily: 'Josefin Sans',
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
          title: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, color: Colors.white),
          body1: TextStyle(fontSize: 12.0),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
