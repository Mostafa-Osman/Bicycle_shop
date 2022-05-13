import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(text: 'About Us', textColor: mainColor,fontSize: 20.0),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(
                  'assets/images/about_us.svg',
                  fit: BoxFit.fitWidth,
                  height: 250,
                ),
              ),
              const CustomText(
                text: 'About US & Our terms',
                fontSize: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, bottom: 30.0),
                child: CustomText(
                  text:
                      'Lorem Ipsum is simply dummy toxt of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, whon an unknown printer took a gallcy of type and scrambled it to make a type specimen book. It has svived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ),
              const CustomText(
                text: 'Version 1.0',
                fontSize: 23,
                textColor: grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
