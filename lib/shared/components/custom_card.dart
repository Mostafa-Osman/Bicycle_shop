import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomCard extends StatelessWidget {
  final Widget widget;
  final double? height;
  final double? width;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;

  const CustomCard({
    required this.widget,
    this.height,
    this.width,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingRight = 10.0,
    this.paddingLeft = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        elevation: 2.0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: mainColor),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop,
            bottom: paddingBottom,
          ),
          child: widget,
        ),
      ),
    );
  }
}
