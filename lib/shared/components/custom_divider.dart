import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;

  const CustomDivider({this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color, thickness: thickness);
  }
}
