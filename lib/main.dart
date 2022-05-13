import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/data_sources/local/pref/pref_setup.dart';
import 'package:udemy_flutter/data/data_sources/local/pref/routing_pref.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/my_app.dart';
import 'package:udemy_flutter/my_bloc_observer.dart';
import 'package:udemy_flutter/route/router.dart';
import 'package:udemy_flutter/shared/components/constants.dart';


Future<void> main() async {
  // to ensure that all method  in project finish loading then open app
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  // await CacheHelper.init();
  await SharedPrefs.init();

  // Widget widget;
  // onBoarding = CacheHelper.getData(key: 'onBoarding');
  //
  // userToken = CacheHelper.getUserToken();
  //
  // (onBoarding == null)
  //     ? widget = OnBoardingScreen()
  //     : (userToken.isEmpty)
  //         ? widget = LoginScreen()
  //         : widget = ShopLayoutScreen();

  log('token:$userToken');
  BlocOverrides.runZoned(
    () {
      runApp(
        BicycleShopApp(
          initialRoute: RoutingPrefs.getInitialRoute(),
          appRoutes: AppRouter(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
