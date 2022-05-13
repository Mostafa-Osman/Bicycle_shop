import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/presentation/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BuildBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  final int splashLength;
  final  PageController controller;

  const BuildBoardingItem(
      {required this.model,
        required this.splashLength,
        required this.controller,});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 40.0, right: 20, left: 20, bottom: 20),
        child: Column(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height*0.5,
              child: SvgPicture.asset(
                model.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            SmoothPageIndicator(
              count: 3,
              controller: controller,
              effect: const WormEffect(
                dotWidth: 15,
                activeDotColor: mainColor,
                dotColor: Color(0xffE4C6A9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
              child: CustomText(
                text: model.title,
                fontSize: size.width >= 500 ? 25 : size.width / 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            CustomText(
              text: model.body,
              textAlign: TextAlign.center,
              fontSize: size.width >= 500 ? 18 : size.width / 22,
              textColor: grey,
            ),
          ],
        ),
      ),
    );
  }
}
