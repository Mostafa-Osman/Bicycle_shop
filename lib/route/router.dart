import 'package:flutter/material.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
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
import 'package:udemy_flutter/presentation/about_us/screens/about.dart';
import 'package:udemy_flutter/presentation/address/screens/add_address_screen.dart';
import 'package:udemy_flutter/presentation/address/screens/my_address.dart';
import 'package:udemy_flutter/presentation/address/screens/update_address_screen.dart';
import 'package:udemy_flutter/presentation/auth/login/screens/login.dart';
import 'package:udemy_flutter/presentation/auth/register/screens/register.dart';
import 'package:udemy_flutter/presentation/basket/screens/basket_screen.dart';
import 'package:udemy_flutter/presentation/contacts/screens/contacts.dart';
import 'package:udemy_flutter/presentation/favourites/screens/favourites.dart';
import 'package:udemy_flutter/presentation/history_orders/screens/my_orders.dart';
import 'package:udemy_flutter/presentation/history_orders/screens/order_detail_screen.dart';
import 'package:udemy_flutter/presentation/home/screens/home.dart';
import 'package:udemy_flutter/presentation/language/screens/language.dart';
import 'package:udemy_flutter/presentation/layout/screens/shop_layout.dart';
import 'package:udemy_flutter/presentation/notifications/screens/notifications_screen.dart';
import 'package:udemy_flutter/presentation/on_boarding/screens/on_boarding.dart';
import 'package:udemy_flutter/presentation/payment/screens/payment.dart';
import 'package:udemy_flutter/presentation/product_details/screens/product_details.dart';
import 'package:udemy_flutter/presentation/profile/screens/profile.dart';
import 'package:udemy_flutter/presentation/questions/screens/questions.dart';
import 'package:udemy_flutter/presentation/search/screens/search.dart';
import 'package:udemy_flutter/presentation/update_profile/screens/update_profile.dart';
import 'package:udemy_flutter/route/route_constants.dart';

class AppRouter {
  late HomeRepository homeRepository;
  late NotificationsRepository notificationsRepository;
  late AddressRepository addressRepository;
  late BasketRepository basketRepository;
  late FavouriteRepository favouriteRepository;
  late LoginRepository loginRepo;
  late OrdersRepository ordersRepo;
  late ProfileRepository profileRepository;
  late RegisterRepository registerRepository;
  late SearchRepository searchRepository;
  late PaymentRepository paymentRepository;

  void initAppSettings() {
    homeRepository = HomeRepository();
    notificationsRepository = NotificationsRepository();
    addressRepository = AddressRepository();
    basketRepository = BasketRepository();
    favouriteRepository = FavouriteRepository();
    loginRepo = LoginRepository();
    ordersRepo = OrdersRepository();
    profileRepository = ProfileRepository();
    registerRepository = RegisterRepository();
    searchRepository = SearchRepository();
    paymentRepository = PaymentRepository();
  }

  Route? generateRoute(RouteSettings settings) {
    initAppSettings();
    switch (settings.name) {
      case RouteConstant.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      case RouteConstant.registerRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case RouteConstant.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case RouteConstant.homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case RouteConstant.notificationsRoute:
        return MaterialPageRoute(
          builder: (_) => NotificationsScreen(),
        );
      case RouteConstant.searchRoute:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );
      case RouteConstant.profileRoute:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case RouteConstant.myAddressRoute:
        return MaterialPageRoute(
          builder: (_) => MyAddressScreen(),
        );
      case RouteConstant.basketRoute:
        return MaterialPageRoute(
          builder: (_) => BasketScreen(),
        );
      case RouteConstant.myOrderRoute:
        return MaterialPageRoute(
          builder: (_) => MyOrdersScreen(),
        );
      case RouteConstant.productDetailsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return ProductDetailsScreen(
              productDetails: settings.arguments! as DetailsData,
            );
          },
        );
      case RouteConstant.shopLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => ShopLayoutScreen(),
        );

      case RouteConstant.paymentRoute:
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(),
        );
      case RouteConstant.favouriteRoute:
        return MaterialPageRoute(
          builder: (_) => FavouritesScreen(),
        );
      case RouteConstant.orderDetailsRoute:
        // final int arguments = settings.arguments as int;
        // final orderId = arguments;
        return MaterialPageRoute(
          builder: (_) =>
              OrderDetailsScreen(),
        );
      case RouteConstant.updateProfileRoute:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileScreen(),
        );
      case RouteConstant.contactsRoute:
        return MaterialPageRoute(
          builder: (_) => ContactsScreen(),
        );
      case RouteConstant.aboutRoute:
        return MaterialPageRoute(
          builder: (_) => AboutUsScreen(),
        );
      case RouteConstant.questionsRoute:
        return MaterialPageRoute(
          builder: (_) => QuestionsScreen(),
        );
      case RouteConstant.languageRoute:
        return MaterialPageRoute(
          builder: (_) => LanguageScreen(),
        );
      case RouteConstant.addAddressRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AddAddressScreen(),
        );
      case RouteConstant.updateAddressRoute:
        // final int arguments = settings.arguments as int;
        // final index = arguments;
        return MaterialPageRoute(
          builder: (_) =>
              UpdateAddressScreen(index: settings.arguments! as int),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
