import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomDotedLine extends StatelessWidget {
  final Color dashColor;
  final double lineThickness;

  const CustomDotedLine({this.dashColor = Colors.black12,this.lineThickness=1.5});

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashLength: 10,
      dashGapLength: 5,
      lineThickness: lineThickness,
      dashColor: dashColor,
      dashGapColor: white,
    );
  }
}
