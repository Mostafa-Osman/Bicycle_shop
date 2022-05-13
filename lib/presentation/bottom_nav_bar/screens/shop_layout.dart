import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BottomNavBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<FavouriteCubit>(context).getFavouritesData();
    return BlocBuilder<BottomNavBarCubit, BottomNavBarStates>(
      builder: (context, state) {
        final bottomNavBarCubit = BlocProvider.of<BottomNavBarCubit>(context);
        return Scaffold(
          appBar: bottomNavBarCubit.appBarScreen[bottomNavBarCubit.currentPageIndex],

          body: Stack(
            children: [
              bottomNavBarCubit.bodyScreen[bottomNavBarCubit.currentPageIndex],
              Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: CurvedNavigationBar(
                index: bottomNavBarCubit.currentPageIndex,
                height: 50,
                backgroundColor: Colors.transparent,
                color: mainColor,
                buttonBackgroundColor: mainColor,
                items: bottomNavBarCubit.bottomNavIcons,
                onTap: (index) => bottomNavBarCubit.changeCurrentIndex(index),
              ),)
            ],
          ),
        );
      },
    );
  }
}
