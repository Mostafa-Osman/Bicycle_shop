import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class FAQ extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(
          context, RouteConstant.questionsRoute),
      child: ListTile(
        leading: SvgPicture.asset(
            'assets/icons/questions.svg',
            fit: BoxFit.cover,
            height: 30,
            width: 30),
        title: CustomText(text: 'F A Q', fontSize: 20),
        subtitle: CustomText(
            text: 'Answers of popular questions',
            fontSize: 15),
        trailing: Icon(Icons.arrow_forward_ios_outlined,
            color: mainColor),
      ),
    );
  }
}
