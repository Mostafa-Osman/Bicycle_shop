import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

import 'package:udemy_flutter/shared/styles/color.dart';

class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: 'Notifications',
          textColor: mainColor,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize =>  const Size.fromHeight(60);
}

class FavouriteAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(text: 'Favourites', textColor: mainColor),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(kToolbarHeight),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    readOnly: true,
                    onTap: () => navigateTo(context, RouteConstant.searchRoute),
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      contentPadding:const EdgeInsets.all(10),
                      prefixIcon:const Icon(Icons.search),
                      hintText: 'Search...',
                      hintStyle:const TextStyle(
                          fontSize: 15,
                          color: grey,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => navigateTo(context, RouteConstant.basketRoute),
                icon: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: SvgPicture.asset(
                    'assets/icons/basket.svg',
                    fit: BoxFit.fitWidth,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: 'My Orders',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: 'Account',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
