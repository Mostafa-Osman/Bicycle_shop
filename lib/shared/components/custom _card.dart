import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final widget;

  const CustomCard({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xFFFFD580), width: 1)),
        child:Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top:10),
          child:  widget,
      ),
    );
  }
}
