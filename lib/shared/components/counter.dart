import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomCounter extends StatelessWidget {
  final increment;
  final decrement;
  final textCount;

  const CustomCounter(
      {required this.increment,
      required this.decrement,
      required this.textCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40.0,
          child: FloatingActionButton(
            heroTag: null,
            onPressed: decrement,
            child: Icon(
              Icons.remove,
              color: white,
              size: 20,
            ),
            backgroundColor: mainColor,
          ),
        ),
        defaultText(text: '${textCount}'),
        SizedBox(
          height: 40.0,
          child: FloatingActionButton(
            heroTag: null,
            onPressed: increment,
            child: Icon(
              Icons.add,
              color: white,
              size: 20,
            ),
            backgroundColor: mainColor,
          ),
        ),
      ],
    );
  }
}
