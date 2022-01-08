
import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color buttonColor;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;

  CustomButton({
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 50,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.buttonColor = mainColor,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(18)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        child: Text(
          text,
          style: TextStyle(
            color: white,
            fontSize: fontSize,
            fontWeight: fontWeight,

          ),
        ),
      ),
    );
  }
}
