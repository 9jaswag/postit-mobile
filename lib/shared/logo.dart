import 'package:flutter/material.dart';

import 'stacked_logo.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StackedLogo(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('POSTIT',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFF36558F),
                    fontWeight: FontWeight.w700
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
