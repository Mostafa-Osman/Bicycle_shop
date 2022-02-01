import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/data/local/cache_helper.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/cubit.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        if (cubit.isLastPage) {
          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
            onBoarding = true;
          });
        } else {
          CacheHelper.removeData(key: 'onBoarding').then((value) {
            onBoarding = false;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Container(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Flexible(
                      child: PageView.builder(
                        itemCount: cubit.items.length,
                        itemBuilder: (context, index) => BuildBoardingItem(
                            model: cubit.items[index],
                            splashLength: cubit.items.length,
                            controller: boardingController),
                        controller: boardingController,
                        onPageChanged: (index) {
                          (index == cubit.items.length - 1)
                              ? cubit.checkLastPage(true)
                              : cubit.checkLastPage(false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: mainColor,
              onPressed: () {
                (cubit.isLastPage)
                    ? navigatorAndFinish(context, RouteConstant.loginRoute)
                    : boardingController.nextPage(
                        duration: Duration(microseconds: 700),
                        curve: Curves.easeIn);
              },
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
            ));
      },
    );
  }
}

class BuildBoardingItem extends StatelessWidget {
  final model;
  final splashLength;
  final controller;

  const BuildBoardingItem(
      {required this.model,
      required this.splashLength,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40.0, right: 20, left: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.asset(
                model.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            SmoothPageIndicator(
              count: 3,
              controller: controller,
              effect: WormEffect(
                dotHeight: 16,
                dotWidth: 20,
                type: WormType.normal,
                activeDotColor: mainColor,
                dotColor: const Color(0xffE4C6A9),
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
