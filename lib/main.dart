import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_layout.dart';
import 'package:udemy_flutter/route/router.dart';
import 'package:udemy_flutter/screens/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/screens/login/ui/login.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/cubit.dart';
import 'package:udemy_flutter/screens/on_boarding/ui/on_boarding.dart';
import 'package:udemy_flutter/screens/orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/screens/register/cubit/recubit.dart';
import 'package:udemy_flutter/screens/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';
import 'package:udemy_flutter/my_bloc_observer.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/my_basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/screens/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/search/cubit/cubit.dart';

import 'data/local/cache_helper.dart';
import 'data/remote/dio_helper.dart';
import 'screens/payment/payment_cubit/payment_cubit.dart';

void main() async {
  // to ensure that all method  in project finish loading then open app
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = MyBlocObserver();
  DioHelper.int();
  await CacheHelper.init();
  Widget widget;
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = await CacheHelper.getData(key: 'token');
  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = LoginScreen();
  } else
    widget = OnBoardingScreen();

  print(token.toString());
  BlocOverrides.runZoned(() => runApp(MyApp(widget: widget)),
      blocObserver: MyBlocObserver()
  );


}

class MyApp extends StatelessWidget {
  final Widget widget;

  MyApp({required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(
            create: (context) => FavouriteCubit()..getFavouritesData()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getHomeData()
              ..getBannerData()),
        BlocProvider(create: (context) => BasketCubit()..getMyBasketData()),
        BlocProvider(create: (context) => MyOrdersCubit()..getOrders()),
        BlocProvider(
            create: (context) => NotificationCubit()..getNotifications()),
        BlocProvider(create: (context) => ProfileCubit()..getUserData()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => PaymentCubit()),
        BlocProvider(create: (context) => UpdateProfileCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        //themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        themeMode: ThemeMode.light,
        home: widget,
        // home: ProductDetails(),
      ),
    );
  }
}
