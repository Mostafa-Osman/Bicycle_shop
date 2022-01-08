import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/layout_cubit/states.dart';
import 'package:udemy_flutter/screens/categories/ui/categories.dart';
import 'package:udemy_flutter/screens/favourites/ui/favourites.dart';
import 'package:udemy_flutter/screens/home/ui/home.dart';
import 'package:udemy_flutter/screens/notifications/ui/notifications_screen.dart';
import 'package:udemy_flutter/screens/profile/ui/profile.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);


  int currentIndex = 2;
  List<Widget> bottomNavScreen = [
    FavouritesScreen(),
    CategoriesScreen(),
    HomeScreen(),
    ProfileScreen(),
    NotificationsScreen(),
  ];
  List<Icon> bottomNavIcons = [
  Icon(Icons.favorite),
  Icon(Icons.apps),
  Icon(Icons.home),
  Icon(Icons.person),
  Icon(Icons.notifications),
  ];
  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}