import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/data_sources/local/cache_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/repository/address_repo/address_repo.dart';
import 'package:udemy_flutter/data/repository/basket_repo/basket_repo.dart';
import 'package:udemy_flutter/data/repository/favourite_repo/favourite_repo.dart';
import 'package:udemy_flutter/data/repository/home_repository/home_repository.dart';
import 'package:udemy_flutter/data/repository/notifications_repo/notifications_repository.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/data/repository/payment_repo/payment_repo.dart';
import 'package:udemy_flutter/data/repository/search_repository/search_repository.dart';
import 'package:udemy_flutter/data/repository/user_repo/login_repo.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/data/repository/user_repo/register_repo.dart';
import 'package:udemy_flutter/my_bloc_observer.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/presentation/auth/login/screens/login.dart';
import 'package:udemy_flutter/presentation/auth/register/cubit/register_cubit.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/presentation/layout/screens/shop_layout.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/presentation/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:udemy_flutter/presentation/on_boarding/screens/on_boarding.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/presentation/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/presentation/search/cubit/search_cubit.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/route/router.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';

import 'presentation/orders/my_orders_cubit/my_orders_cubit.dart';



Future<void> main() async {
  // to ensure that all method  in project finish loading then open app
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token').toString();

  (onBoarding == null)
      ? widget = OnBoardingScreen()
      : (token == null)
          ? widget = LoginScreen()
          : widget = ShopLayoutScreen();

  log(token!);
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(
        widget: widget,
        appRoutes: AppRouter(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget widget;
  final AppRouter appRoutes;

  const MyApp({required this.widget, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => RegisterCubit(RegisterRepository())),
        BlocProvider(create: (context) => LoginCubit(LoginRepository())),
        BlocProvider(create: (context) => SearchCubit(SearchRepository())),
        BlocProvider(
          create: (context) =>
          BasketCubit(BasketRepository())..getMyBasketData(),
        ),
        BlocProvider(create: (context) => ProductDetailsCubit()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
          create: (context) => HomeCubit(HomeRepository())..getHomeData(),
        ),
        BlocProvider(
          create: (context) =>
          FavouriteCubit(FavouriteRepository())..getFavouritesData(),
        ),

        BlocProvider(
          create: (context) => MyOrdersCubit(OrdersRepository())..getOrders(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(NotificationsRepository())
            ..getNotificationsData(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRepository())..getUserData(),
        ),
        BlocProvider(create: (context) => PaymentCubit(PaymentRepository())),
        BlocProvider(
          create: (context) => UpdateProfileCubit(
            ProfileRepository(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              AddressCubit(AddressRepository())..getMyAddressData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.generateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: widget,
      ),
    );
  }
}
