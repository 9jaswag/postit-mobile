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
      ),
      home: SplashScreen(),
    );
  }
}
