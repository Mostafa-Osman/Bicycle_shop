import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CardItem extends StatelessWidget {
  final String  title;
  final List<String> labels;
  final int selectedIndex;
  final Function(int) selectedLabelIndex;

  const CardItem({
    required this.labels,
    required this.title,
    required this.selectedIndex,
    required this.selectedLabelIndex,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 14,
            height: 1.7,
          ),
          const Spacer(),
          FlutterToggleTab(
              width: 25,
              height: 30,
              selectedBackgroundColors: const [mainColor],
              borderRadius: 10,
              selectedTextStyle: const TextStyle(
                  color: white, fontSize: 14, fontWeight: FontWeight.w300,),
              unSelectedTextStyle: const TextStyle(
                  color: black, fontSize: 14, fontWeight: FontWeight.w300,),
              labels: labels,
              selectedIndex: selectedIndex,
              selectedLabelIndex: selectedLabelIndex,),
        ],
      );
  }
}
