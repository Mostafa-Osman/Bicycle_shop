import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/layout_cubit/states.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/categories/ui/categories.dart';
import 'package:udemy_flutter/screens/last_orders/ui/my_orders.dart';
import 'package:udemy_flutter/screens/favourites/ui/favourites.dart';
import 'package:udemy_flutter/screens/home/ui/home.dart';
import 'package:udemy_flutter/screens/my_basket/ui/basket_screen.dart';
import 'package:udemy_flutter/screens/notifications/ui/notifications_screen.dart';
import 'package:udemy_flutter/screens/profile/ui/profile.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  int lastPageIndex = 0;
  List<Widget> bottomNavScreen = [
    HomeScreen(),
    NotificationsScreen(),
   BasketScreen(),
    MyOrderScreen(),
    ProfileScreen(),
  ];
  List<Widget> bottomNavIcons = [
    Icon(Icons.home, color: lightMainColor, size: 30.0),
    Icon(Icons.notifications, color: lightMainColor, size: 30.0),
    Icon(Icons.add_shopping_cart_rounded, size: 30.0, color: lightMainColor),
    SizedBox(
        height: 30.0,
        width: 30.0,
        child: Image.asset(
          'assets/icons/bag.png',
          color: lightMainColor,
        )),

    // Icon(Icons.apps, color: Colors.grey[200]),

    Icon(Icons.person, color: lightMainColor, size: 30.0),
  ];

  void changeCurrentIndex(index) {
    lastPageIndex = currentPageIndex;
    currentPageIndex = index;
    emit(ChangeBottomNavState());
  }
}
