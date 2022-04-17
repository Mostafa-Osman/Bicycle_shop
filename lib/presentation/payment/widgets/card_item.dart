import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
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
    return CustomCard(
      widget: SizedBox(
        height: 100,
        width: double.infinity,
        child: Column(
          children: [
            CustomText(
              text: title,
              fontSize: 18,
            ),
            const SizedBox(height: 15),
            FlutterToggleTab(
                width: 50,
                selectedBackgroundColors: const [mainColor],
                borderRadius: 15,
                selectedTextStyle: const TextStyle(
                    color: white, fontSize: 18, fontWeight: FontWeight.w600,),
                unSelectedTextStyle: const TextStyle(
                    color: black, fontSize: 14, fontWeight: FontWeight.w400,),
                labels: labels,
                selectedIndex: selectedIndex,
                selectedLabelIndex: selectedLabelIndex,),
          ],
        ),
      ),
    );
  }
}
