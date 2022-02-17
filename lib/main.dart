import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/presentation/layout/screens/shop_layout.dart';
import 'package:udemy_flutter/presentation/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/presentation/login/screens/login.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/presentation/on_boarding/on_boarding_cubit/cubit.dart';
import 'package:udemy_flutter/presentation/on_boarding/screens/on_boarding.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/presentation/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/presentation/register/cubit/recubit.dart';
import 'package:udemy_flutter/presentation/search/cubit/cubit.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/route/router.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';
import 'package:udemy_flutter/my_bloc_observer.dart';
import 'data/data_sources/local/cache_helper.dart';
import 'data/data_sources/remote/dio_helper.dart';

void main() async {
  // to ensure that all method  in project finish loading then open app
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.int();
  await CacheHelper.init();
  Widget widget;
  onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = await CacheHelper.getData(key: 'token');

  (onBoarding == null)
      ? widget = OnBoardingScreen()
      : (token == null)
      ? widget = LoginScreen()
      : widget = ShopLayoutScreen();

  print(token.toString());
  BlocOverrides.runZoned(() => runApp(MyApp(widget: widget)),
      blocObserver: MyBlocObserver());
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
        BlocProvider(create: (context) => ProductDetailsCubit()),
        BlocProvider(create: (context) => BasketCubit()..getMyBasketData()),
        BlocProvider(create: (context) => MyOrdersCubit()..getOrders()),
        BlocProvider(
            create: (context) => NotificationCubit()..getNotifications()),
        BlocProvider(create: (context) => ProfileCubit()..getUserData()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => PaymentCubit()),

        BlocProvider(create: (context) => UpdateProfileCubit()),
        BlocProvider(create: (context) => AddressCubit()..getMyAddressData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home:widget
      ),
    );
  }
}