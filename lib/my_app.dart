import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/data_sources/local/pref/user_pref.dart';
import 'package:udemy_flutter/data/repository/address_repo/address_repo.dart';
import 'package:udemy_flutter/data/repository/basket_repo/basket_repo.dart';
import 'package:udemy_flutter/data/repository/favourite_repo/favourite_repo.dart';
import 'package:udemy_flutter/data/repository/home_repository/home_repository.dart';
import 'package:udemy_flutter/data/repository/notifications_repo/notifications_repository.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/data/repository/payment_repo/payment_repo.dart';
import 'package:udemy_flutter/data/repository/product_details_repository/product_details_repository.dart';
import 'package:udemy_flutter/data/repository/search_repository/search_repository.dart';
import 'package:udemy_flutter/data/repository/user_repo/login_repo.dart';
import 'package:udemy_flutter/data/repository/user_repo/logout.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/data/repository/user_repo/register_repo.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/presentation/auth/logout/logout_cubit.dart';
import 'package:udemy_flutter/presentation/auth/register/cubit/register_cubit.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/presentation/notifications/notification_cubit/notification_cubit.dart';
import 'package:udemy_flutter/presentation/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/presentation/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/presentation/search/cubit/search_cubit.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/route/router.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';

class BicycleShopApp extends StatelessWidget {
  final AppRouter appRoutes;
  final String? initialRoute;

  const BicycleShopApp({required this.initialRoute, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => RegisterCubit(RegisterRepository())),
        BlocProvider(create: (context) => LoginCubit(LoginRepository())),
        BlocProvider(create: (context) => SearchCubit(SearchRepository())),
        BlocProvider(
          create: (context) =>
              BasketCubit(BasketRepository(UserPrefs()))..getMyBasketData(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit(ProductDetailsRepository()),
        ),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
          create: (context) => HomeCubit(HomeRepository())..getHomeData(),
        ),
        BlocProvider(
          create: (context) =>
              FavouriteCubit(FavouriteRepository(UserPrefs()))..getFavouritesData(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(NotificationsRepository())
            ..getNotificationsData(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRepository(UserPrefs())),
        ),
        BlocProvider(create: (context) => PaymentCubit(PaymentRepository(UserPrefs()))),
        BlocProvider(
          create: (context) => UpdateProfileCubit(
            ProfileRepository(UserPrefs()),
          ),
        ),
        BlocProvider(
          create: (context) => HistoryOrdersCubit(
            OrdersRepository(UserPrefs()),
          )..getOrders(),
        ),
        BlocProvider(
          create: (context) =>
              AddressCubit(AddressRepository(UserPrefs()))..getMyAddressData(),
        ),
        BlocProvider(
            create: (context) => LogoutCubit(LogoutRepository(UserPrefs())),),
      ],
      child: MaterialApp(
        title: 'Bicycle Shop',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.generateRoute,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: initialRoute,
      ),
    );
  }
}
