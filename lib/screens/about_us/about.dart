import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: CustomText(text: 'About Us', textColor: mainColor),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset('assets/images/about_us.svg',
                  fit: BoxFit.fitWidth, height: 250),
            ),
            CustomText(
              text: 'About US & Our terms',
              fontSize: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 10.0,bottom: 30.0),
              child: CustomText(
                text:
                    'Lorem Ipsum is simply dummy toxt of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, whon an unknown printer took a gallcy of type and scrambled it to make a type specimen book. It has svived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                fontSize: 20,textAlign:TextAlign.center ,
              ),
            ),
            CustomText(
                text: 'Version 1.0',
                fontSize: 23,
                textColor: grey,
                textAlign:TextAlign.center ,
            ),
          ],
        ),
      ),
    );
  }
}
