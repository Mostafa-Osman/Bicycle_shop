import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomCard extends StatelessWidget {
  final widget;

  const CustomCard({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:mainColor, width: 1)),
        child:Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top:10),
          child:  widget,
      ),
    );
  }
}
