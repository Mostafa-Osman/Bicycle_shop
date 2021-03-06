import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/data_sources/local/pref/routing_pref.dart';
import 'package:udemy_flutter/presentation/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:udemy_flutter/presentation/on_boarding/widgets/build_on_boarding_item.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController boardingController = PageController();

  @override
  void initState() {
    super.initState();
    RoutingPrefs.setOnBoardingSeen();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingStates>(
      // listener: (context, state) {
      //   if (cubit.isLastPage) {
      //     CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      //       onBoarding = true;
      //     });
      //   } else {
      //     CacheHelper.removeData(key: 'onBoarding').then((value) {
      //       onBoarding = false;
      //     });
      //   }
      // },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: PageView.builder(
                itemCount: cubit.items.length,
                itemBuilder: (context, index) => BuildBoardingItem(
                  model: cubit.items[index],
                  splashLength: cubit.items.length,
                  controller: boardingController,
                ),
                controller: boardingController,
                onPageChanged: (index) {
                  (index == cubit.items.length - 1)
                      ? cubit.checkLastPage(changeText: true)
                      : cubit.checkLastPage(changeText: false);
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () {
              (cubit.isLastPage)
                  ? navigatorAndFinish(context, RouteConstant.loginRoute)
                  : boardingController.nextPage(
                      duration: const Duration(microseconds: 700),
                      curve: Curves.easeIn,
                    );
            },
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
