import 'package:flutter/material.dart';

import 'shared/stacked_logo.dart';

void main() => runApp(PostIt());

class PostIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PostIT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // make the contents of the column stay in the center
          mainAxisAlignment: MainAxisAlignment.center,
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
            )
          ],
        ),
      ),
    );
  }
}
