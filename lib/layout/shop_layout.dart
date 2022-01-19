import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'layout_cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
            appBar: cubit.appBarScreen[cubit.currentPageIndex],

            body: cubit.bottomNavScreen[cubit.currentPageIndex],
            bottomNavigationBar: CurvedNavigationBar(
                index: 2,
                height: 50,
                backgroundColor: white,
                color: mainColor,
                buttonBackgroundColor: mainColor,
                items: cubit.bottomNavIcons,
                onTap: (index) => cubit.changeCurrentIndex(index)));
      },
    );
  }
}
