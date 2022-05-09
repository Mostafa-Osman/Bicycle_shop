import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  const CustomText({
    required this.text,
    this.fontSize = 25.0,
    this.textAlign,
    this.fontWeight,
    this.textColor,
    this.decoration,
    this.maxLines,
    this.overflow,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        height: height,
        decoration: decoration,
        fontFamily: 'RobotoSerif',
      ),
    );
  }
}
