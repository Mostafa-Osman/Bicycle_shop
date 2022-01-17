import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/layout/app_bar.dart';
import 'package:udemy_flutter/layout/layout_cubit/states.dart';
import 'package:udemy_flutter/screens/home/ui/home.dart';
import 'package:udemy_flutter/screens/my_basket/ui/basket_screen.dart';
import 'package:udemy_flutter/screens/notifications/ui/notifications_screen.dart';
import 'package:udemy_flutter/screens/orders/ui/my_orders.dart';
import 'package:udemy_flutter/screens/profile/ui/profile.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  int lastPageIndex = 0;

  List<PreferredSizeWidget> appBarScreen = [
    NotificationsAppBar(),
    BasketAppBar(),
    OrdersAppBar(),
    ProfileAppBar(),
  ];

  List<Widget> bottomNavScreen = [
    HomeScreen(),
    NotificationsScreen(),
    BasketScreen(),
    MyOrdersScreen(),
    ProfileScreen(),
  ];
  List<Widget> bottomNavIcons = [
    Icon(Icons.home, color: lightMainColor, size: 30.0),
    Icon(Icons.notifications, color: lightMainColor, size: 30.0),
    SizedBox(
      height: 30.0,
      width: 30.0,
      child: SvgPicture.asset(
        'assets/icons/basket.svg',
        fit: BoxFit.fitWidth,
      ),
    ),
    SizedBox(
        height: 30.0,
        width: 30.0,
        child: Image.asset(
          'assets/icons/bag.png',
          color: lightMainColor,
        )),
    Icon(Icons.person, color: lightMainColor, size: 30.0),
  ];

  void changeCurrentIndex(index) {
    lastPageIndex = currentPageIndex;
    currentPageIndex = index;
    emit(ChangeBottomNavState());
  }
}
