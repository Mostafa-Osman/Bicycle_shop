import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/cubit.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/states.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

class OnBoardingScreen extends StatelessWidget {
  final boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                TextButton(
                  child: Text('SKIP'),
                  onPressed: () =>
                      navigatorAndFinish(context, RouteConstant.loginRoute),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                    itemCount: cubit.model.length,
                    itemBuilder: (context, index) =>
                        buildBoardingItem(cubit.model[index]),
                    controller: boardingController,
                    onPageChanged: (index) {
                      (index == cubit.model.length - 1)
                          ? cubit.isLast = true
                          : cubit.isLast = false;
                    },
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  SmoothPageIndicator(
                    count: cubit.model.length,
                    controller: boardingController,
                    effect: WormEffect(activeDotColor: Colors.purpleAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.purpleAccent,
                onPressed: () {
                  (cubit.isLast)
                      ? navigatorAndFinish(context, RouteConstant.loginRoute)
                      : boardingController.nextPage(
                          duration: Duration(microseconds: 700),
                          curve: Curves.easeIn);
                },
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                )));
      },
    );
  }
}

Widget buildBoardingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(model.image)),
        CustomText(text: model.title, textColor: Colors.black),
        SizedBox(height: 20),
        CustomText(text: model.body, textColor: Colors.black),
      ],
    );
