import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomCard extends StatelessWidget {
  final Widget widget;

  const CustomCard({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10.0,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color:mainColor),),
        child:Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top:10.0),
          child:  widget,
      ),
    );
  }
}
