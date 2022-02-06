import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SignOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => signOut(context),
      child: CustomCard(
        widget: Column(
          children: [
            ListTile(
              title: CustomText(
                  text: 'Sign out', textColor: red),
              trailing: Icon(Icons.logout, color: red),
            ),
          ],
        ),
      ),
    );
  }
}
