import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color buttonColor;
  final double radiusCircular;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color textColor;

  const CustomButton({
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 50,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.radiusCircular = 10.0,
    this.buttonColor = mainColor,
    required this.onPressed,
    required this.text,
    this.textColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius:
            BorderRadiusDirectional.all(Radius.circular(radiusCircular)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'RobotoSerif',
          ),
        ),
      ),
    );
  }
}
