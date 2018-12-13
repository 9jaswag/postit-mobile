import 'package:flutter/material.dart';
import 'dart:async'; // Timer
import 'package:flutter/services.dart'; // systemchannels

import 'package:postit/shared/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 2;

  startTime() async {
    return Timer(Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod(
          'TextInput.hide'); // force the soft keyboard to hide, in case some other method or app has left it open
      Navigator.of(context).pushReplacementNamed('/RootScreen');
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Logo(),
      ),
    );
  }
}
