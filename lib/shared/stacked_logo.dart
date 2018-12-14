import 'package:flutter/material.dart';

import 'circular_icon.dart';

class StackedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircularIcon(
          backgroundColor: Color(0xFF40376E),
          icon: Icons.email,
          iconColor: Colors.white,
          marginBottom: 0,
          marginTop: 0,
          marginRight: 0,
          marginLeft: 0,
        ),
        CircularIcon(
          backgroundColor: Color(0xFF48233C), //(#00bfa5)
          icon: Icons.chat,
          iconColor: Colors.white,
          marginBottom: 0,
          marginTop: 50.0,
          marginRight: 50.0,
          marginLeft: 0,
        ),
        CircularIcon(
          backgroundColor: Color(0xFF36558F),
          icon: Icons.alternate_email,
          iconColor: Colors.white,
          marginBottom: 0,
          marginTop: 60.0,
          marginRight: 0,
          marginLeft: 30.0,
        )
      ],
    );
  }
}
