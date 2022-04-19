import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        signOut();
        navigatorAndFinish(context, RouteConstant.loginRoute);
      },
      child: CustomCard(
        height: 65.0,
        width: double.infinity,
        widget: Column(
          children: const [
            ListTile(
              title: CustomText(
                text: 'Sign out',
                textColor: red,
                fontSize: 15.0,
              ),
              trailing: Icon(
                Icons.logout,
                color: red,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
