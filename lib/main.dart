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
import 'package:udemy_flutter/screens/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/screens/register/cubit/recubit.dart';
import 'package:udemy_flutter/screens/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';
import 'package:udemy_flutter/screens/categories/category_cubit/category_cubit.dart';
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
  Bloc.observer = MyBlocObserver();
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

  runApp(MyApp(widget: widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;

  MyApp({required this.widget});

  final registerBloc = RegisterCubit();
  final loginBloc = LoginCubit();
  final searchBloc = SearchCubit();
  final profileBloc = ProfileCubit();
  final homeBloc = HomeCubit();
  final favouriteBloc = FavouriteCubit();
  final categoryBloc = CategoryCubit();
  final basketBloc = BasketCubit();
  final myOrdersBloc = MyOrdersCubit();
  final notificationBloc = NotificationCubit();
  final layoutBloc = LayoutCubit();
  final onBoardingBloc = OnBoardingCubit();
  final paymentBloc = PaymentCubit();
  final updateProfileBloc = UpdateProfileCubit();
  final orderDetailsBloc = OrderDetailsCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => registerBloc),
        BlocProvider(create: (context) => loginBloc),
        BlocProvider(create: (context) => searchBloc),
        BlocProvider(create: (context) => favouriteBloc..getFavouritesData()),
        BlocProvider(
            create: (context) => homeBloc
              ..getHomeData()
              ..getBannerData()),
        BlocProvider(create: (context) => categoryBloc..getCategoriesData()),
        BlocProvider(create: (context) => basketBloc..getMyBasketData()),
        BlocProvider(create: (context) => myOrdersBloc..getOrders()),
        BlocProvider(create: (context) => notificationBloc..getNotifications()),
        BlocProvider(create: (context) => profileBloc..getUserData()),
        BlocProvider(create: (context) => layoutBloc),
        BlocProvider(create: (context) => onBoardingBloc),
        BlocProvider(create: (context) => paymentBloc),
        BlocProvider(create: (context) => updateProfileBloc),
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
