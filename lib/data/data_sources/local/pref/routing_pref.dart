import 'package:udemy_flutter/data/data_sources/local/pref/pref_setup.dart';
import 'package:udemy_flutter/route/route_constants.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static void setOnBoardingSeen() => SharedPrefs.instance.setBool("seen", true);

  static bool isOnBoardingSeen() =>
      SharedPrefs.instance.getBool("seen") ?? false;

  static String getInitialRoute() => isOnBoardingSeen() == true
      ? RouteConstant.shopLayoutRoute
      : RouteConstant.onBoardingRoute;
}
