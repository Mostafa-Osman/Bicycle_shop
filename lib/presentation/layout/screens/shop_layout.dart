import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ShopLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        final layoutCubit = BlocProvider.of<LayoutCubit>(context);
        return Scaffold(
          appBar: layoutCubit.appBarScreen[layoutCubit.currentPageIndex],
          body: layoutCubit.bottomNavScreen[layoutCubit.currentPageIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: layoutCubit.currentPageIndex,
            height: 50,
            backgroundColor: white,
            color: mainColor,
            buttonBackgroundColor: mainColor,
            items: layoutCubit.bottomNavIcons,
            onTap: (index) => layoutCubit.changeCurrentIndex(index),
          ),
        );
      },
    );
  }
}
