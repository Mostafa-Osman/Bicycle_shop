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
          context, RouteConstant.languageRoute,),
      child: ListTile(
        leading: SvgPicture.asset(
            'assets/icons/language.svg',
            fit: BoxFit.cover,
            height: 32,
            width: 32,
        ),
        title:
        const CustomText(text: 'Language',fontSize: 15,
          fontWeight: FontWeight.w400,),
        subtitle:
        const CustomText(text: 'English', fontSize: 12),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,
            color: mainColor,size: 25.0,),
      ),
    );
  }
}
