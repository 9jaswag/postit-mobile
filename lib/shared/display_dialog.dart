import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void DisplayDialog(
    BuildContext context, String title, String message, String buttonLabel) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog(title, message, buttonLabel, context);
      });
}

alertDialog(
    String title, String message, String buttonLabel, BuildContext context) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(message),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(buttonLabel),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  } else {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(buttonLabel),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
