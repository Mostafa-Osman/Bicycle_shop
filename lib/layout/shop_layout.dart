import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';

import 'layout_cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFFFD580),
            title: defaultText(
              text: 'Home Page',
              // backgroundColor: Color(0xFFFFD580)
            ),
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                )),
            actions: [
              IconButton(
                onPressed: ()=>
                  navigateTo(context, RouteConstant.myBagRoute),
                icon: Icon(
                  Icons.add_shopping_cart,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: cubit.bottomNavScreen[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: 2,
            height: 50,
            backgroundColor: Color(0xFFFFFFFF),
            color: Color(0xFFFFD580),
            buttonBackgroundColor: Colors.deepOrange,
            items:cubit.bottomNavIcons,
            onTap: (index) =>
              cubit.changeCurrentIndex(index),

          ),
        );
      },
    );
  }
}
