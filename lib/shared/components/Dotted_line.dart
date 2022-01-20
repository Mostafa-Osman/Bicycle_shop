import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomDotedLine extends StatelessWidget {
  final dashColor;

  const CustomDotedLine({this.dashColor = Colors.black12});

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashLength: 10,
      dashGapLength: 5,
      lineThickness: 1.5,
      dashColor: dashColor,
      dashGapColor: white,
    );
  }
}
