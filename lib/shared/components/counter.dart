import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomCounter extends StatelessWidget {
  final Function increment;
  final Function decrement;
  final String textCount;

  const CustomCounter({
    required this.increment,
    required this.decrement,
    required this.textCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40.0,
          child: ElevatedButton(
            onPressed: () => decrement,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: mainColor, // <-- Button color
            ),
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
          child: ElevatedButton(
            onPressed: () => increment,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: mainColor, // <-- Button color
            ),
            child: const Icon(
              Icons.remove,
              color: white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
