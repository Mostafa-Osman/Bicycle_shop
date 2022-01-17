import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          iconSize: 28,
          color: black,
          icon: Icon(
            Icons.settings_rounded,
            color: mainColor,
          ),
          onPressed: () {
            navigateTo(context, RouteConstant.updateProfileRoute);
          },
        ),
        title: CustomText(
          text: 'Profile',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(60);
}

class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: CustomText(
          text: 'Notifications',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(60);
}

class BasketAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: CustomText(
          text: 'My Basket',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //     // متمسحش التعليق ده مهم جدا جدا جدا
        //     // navigateReplacement(context,
        //     //    LayoutCubit.get(context).bottomNavScreen[lastPageIndex]
        //     // );
        //   },
        //   icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        // ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(60);
}

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: CustomText(
          text: 'My Orders',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(60);
}
