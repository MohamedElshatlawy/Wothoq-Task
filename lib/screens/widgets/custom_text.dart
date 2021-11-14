import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;
  CustomText(
      {Key key,
      this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: decoration,
      ),
    );
  }
}
