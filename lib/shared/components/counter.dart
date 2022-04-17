import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomCounter extends StatelessWidget {
  final Function  increment;
  final Function decrement;
  final String textCount;

  const CustomCounter(
      {required this.increment,
      required this.decrement,
      required this.textCount,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40.0,
          child: FloatingActionButton(
            heroTag: null,
            onPressed: ()=>decrement,
            backgroundColor: mainColor,
            child: const Icon(
              Icons.remove,
              color: white,
              size: 20,
            ),
          ),
        ),
        CustomText(text: textCount),
        SizedBox(
          height: 40.0,
          child: FloatingActionButton(
            heroTag: null,
            onPressed:()=> increment,
            backgroundColor: mainColor,
            child: const Icon(
              Icons.add,
              color: white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
