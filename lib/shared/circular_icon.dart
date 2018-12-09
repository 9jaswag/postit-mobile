import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CircularIcon extends StatelessWidget {
  final double marginRight;
  final double marginLeft;
  final double marginTop;
  final double marginBottom;
  final Color backgroundColor;
  final iconColor;
  final icon;

  const CircularIcon(
      {@required this.backgroundColor,
      @required this.iconColor,
      @required this.icon,
      this.marginRight,
      this.marginLeft,
      this.marginTop,
      this.marginBottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: marginRight,
          left: marginLeft,
          top: marginTop,
          bottom: marginBottom),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: backgroundColor //(#00bfa5)
          ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
