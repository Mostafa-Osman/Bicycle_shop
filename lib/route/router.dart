import 'package:flutter/material.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/about_us/ui/about.dart';
import 'package:udemy_flutter/presentation/address/ui/add_address_screen.dart';
import 'package:udemy_flutter/presentation/address/ui/update_address_screen.dart';
import 'package:udemy_flutter/presentation/basket/ui/basket_screen.dart';
import 'package:udemy_flutter/presentation/contacts/ui/contacts.dart';
import 'package:udemy_flutter/presentation/favourites/ui/favourites.dart';
import 'package:udemy_flutter/presentation/home/ui/home.dart';
import 'package:udemy_flutter/presentation/language/language.dart';
import 'package:udemy_flutter/presentation/layout/ui/shop_layout.dart';
import 'package:udemy_flutter/presentation/login/ui/login.dart';
import 'package:udemy_flutter/presentation/notifications/ui/notifications_screen.dart';
import 'package:udemy_flutter/presentation/on_boarding/ui/on_boarding.dart';
import 'package:udemy_flutter/presentation/orders/ui/my_orders.dart';
import 'package:udemy_flutter/presentation/orders_details/ui/order_detail_screen.dart';
import 'package:udemy_flutter/presentation/payment/ui/payment.dart';
import 'package:udemy_flutter/presentation/product_details/ui/product_details.dart';
import 'package:udemy_flutter/presentation/profile/ui/profile.dart';
import 'package:udemy_flutter/presentation/questions/ui/questions.dart';
import 'package:udemy_flutter/presentation/register/ui/register.dart';
import 'package:udemy_flutter/presentation/search/ui/search.dart';
import 'package:udemy_flutter/presentation/update_profile/ui/update_profile.dart';
import 'route_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RouteConstant.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteConstant.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteConstant.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteConstant.notificationsRoute:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case RouteConstant.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case RouteConstant.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteConstant.basketRoute:
        return MaterialPageRoute(builder: (_) => BasketScreen());
      case RouteConstant.myOrderRoute:
        return MaterialPageRoute(builder: (_) => MyOrdersScreen());
      case RouteConstant.productDetailsRoute:
        return MaterialPageRoute(builder: (_) {
          final DetailsData arguments = settings.arguments as DetailsData;

          return ProductDetailsScreen(productDetails: arguments);
        });
      case RouteConstant.shopLayoutRoute:
        return MaterialPageRoute(builder: (_) => ShopLayoutScreen());
      case RouteConstant.paymentRoute:
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      case RouteConstant.favouriteRoute:
        return MaterialPageRoute(builder: (_) => FavouritesScreen());
      case RouteConstant.orderDetailsRoute:
        final int arguments = settings.arguments as int;
        var orderId = arguments;
        return MaterialPageRoute(
            builder: (_) => OrderDetailsScreen(orderId: orderId));
      case RouteConstant.updateProfileRoute:
        return MaterialPageRoute(builder: (_) => UpdateProfileScreen());
      case RouteConstant.contactsRoute:
        return MaterialPageRoute(builder: (_) => ContactsScreen());
      case RouteConstant.aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case RouteConstant.questionsRoute:
        return MaterialPageRoute(builder: (_) => QuestionsScreen());
      case RouteConstant.languageRoute:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case RouteConstant.addAddressRoute:
        return MaterialPageRoute(builder: (_) => AddAddressScreen());
      case RouteConstant.updateAddressRoute:
        final int arguments = settings.arguments as int;
        var index = arguments;
        return MaterialPageRoute(
            builder: (_) => UpdateAddressScreen(index: index));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
