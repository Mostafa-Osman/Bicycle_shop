import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var userInformation = userData!.data;
    return      InkWell(
      child: CustomCard(
        widget: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: ClipOval(
                child: Image.network(
                  userInformation!.image!,
                  height: 150,
                  width: 70,
                  fit: BoxFit.cover,
                )),
            title: CustomText(
              text: '${userInformation.name}',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text: '${userInformation.phone}',
              fontSize: 15,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined,
                color: mainColor),
          ),
        ),
      ),
      onTap: () =>
          navigateTo(context, RouteConstant.profileRoute),
    );
  }
}
