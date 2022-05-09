import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? textHint;
  final Color? hintColor;

  final Color textColor;

  final Color? backgroundColor;

  final Icon? prefix;
  final double? roundedRectangleBorder;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? label;
  final String? initialValue;
  final double? fontSize;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    required this.controller,
    this.validator,
    this.textHint,
    this.hintColor = Colors.grey,
    this.roundedRectangleBorder = 25.0,
    this.backgroundColor = Colors.white,
    this.obscureText = false,
    this.suffixIcon,
    this.fontSize = 15.0,
    this.textColor = black,
    this.prefix,
    this.keyboardType,
    this.textInputAction,
    this.label,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      initialValue: initialValue,
      textInputAction: textInputAction,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: 'RobotoSerif',
      ),
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,

        fillColor: backgroundColor,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(roundedRectangleBorder!)),
        ),
        prefixIcon: prefix,

        hintStyle: TextStyle(color: hintColor),

        // icon: icon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }
}
