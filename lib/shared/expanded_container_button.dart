import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ExpandedContainerButton extends StatelessWidget {
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final String text;
  final double fontSize;
  final textColor;

  const ExpandedContainerButton(
      {@required this.backgroundColor,
      @required this.height,
      @required this.borderRadius,
      @required this.text,
      @required this.fontSize,
      @required this.textColor})
      : assert(backgroundColor != null),
        assert(height != null),
        assert(borderRadius != null),
        assert(text != null),
        assert(fontSize != null),
        assert(textColor != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
