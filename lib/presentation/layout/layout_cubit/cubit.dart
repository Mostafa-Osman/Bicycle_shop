import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/account/screens/account_screen.dart';
import 'package:udemy_flutter/presentation/favourites/screens/favourites.dart';
import 'package:udemy_flutter/presentation/home/screens/home.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/states.dart';
import 'package:udemy_flutter/presentation/layout/screens/app_bar.dart';
import 'package:udemy_flutter/presentation/notifications/screens/notifications_screen.dart';
import 'package:udemy_flutter/presentation/orders/screens/my_orders.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 2;

  List<PreferredSizeWidget> appBarScreen = [
    NotificationsAppBar(),
    FavouriteAppBar(),
    HomeAppBar(),
    OrdersAppBar(),
    AccountAppBar(),
  ];

  List<Widget> bottomNavScreen = [
    NotificationsScreen(),
    FavouritesScreen(),
    HomeScreen(),
    MyOrdersScreen(),
    AccountScreen(),
  ];
  List<Widget> bottomNavIcons = [
    Icon(Icons.notifications, color: lightMainColor, size: 30.0),
    Icon(Icons.favorite, color: lightMainColor, size: 30),
    Icon(Icons.home, color: lightMainColor, size: 30.0),
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
    currentPageIndex = index;
    emit(ChangeBottomNavState());
  }
}
