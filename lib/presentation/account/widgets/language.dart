import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class Language extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => navigateTo(
          context, RouteConstant.languageRoute),
      child: ListTile(
        leading: SvgPicture.asset(
            'assets/icons/language.svg',
            fit: BoxFit.cover,
            height: 30,
            width: 30),
        title:
        CustomText(text: 'Language', fontSize: 20),
        subtitle:
        CustomText(text: 'English', fontSize: 15),
        trailing: Icon(Icons.arrow_forward_ios_outlined,
            color: mainColor),
      ),
    );
  }
}
