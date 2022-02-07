import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/profile/widgets/profile_address.dart';
import 'package:udemy_flutter/presentation/profile/widgets/profile_photo.dart';
import 'package:udemy_flutter/presentation/profile/widgets/user_data.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

class ProfileScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        title: CustomText(
          text: 'Profile',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 28,
            icon: Icon(
              Icons.settings_rounded,
              color: mainColor,
            ),
            onPressed: () {
              navigateTo(context, RouteConstant.updateProfileRoute);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 500,
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                //profile photo
                ProfilePhoto(),
                //user data (name,email phone)
                UserDataWidget(),
                SizedBox(height: 20.0),
                //profile address
                ProfileAddress(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
