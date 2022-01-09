import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CardItem extends StatelessWidget {
  final title;
  final labels;
  final selectedIndex;
  final selectedLabelIndex;

  const CardItem(
      {required this.labels,
        this.title,
        this.selectedIndex,
        this.selectedLabelIndex});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: SizedBox(
        height: 100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
            text:  title,
             fontSize: 18
            ),
            SizedBox(height: 15),
            FlutterToggleTab(
                width: 50,
                borderRadius: 15,
                selectedTextStyle: TextStyle(
                    color: white, fontSize: 18, fontWeight: FontWeight.w600),
                unSelectedTextStyle: TextStyle(
                    color: black, fontSize: 14, fontWeight: FontWeight.w400),
                labels: labels,
                selectedIndex: selectedIndex,
                selectedLabelIndex:selectedLabelIndex),
          ],
        ),
      ),
    );
  }
}
