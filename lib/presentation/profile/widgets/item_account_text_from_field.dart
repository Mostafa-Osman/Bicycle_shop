import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: lightMainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          shape: BoxShape.rectangle,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(icon, color: mainColor),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: CustomText(
                    text: text,
                    fontSize: size.width >= 500 ? 18 : size.width / 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
