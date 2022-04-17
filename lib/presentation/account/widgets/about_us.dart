import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AboutUS extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () =>
          navigateTo(context, RouteConstant.aboutRoute),
      child: ListTile(
        leading: SvgPicture.asset(
            'assets/icons/about_us_icon.svg',
            fit: BoxFit.cover,
            height: 30,
            width: 30,),
        title:
        const CustomText(text: 'About Us', fontSize: 20),
        subtitle: const CustomText(
            text: 'Terms of use', fontSize: 15,),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,
            color: mainColor,),
      ),
    );
  }
}
