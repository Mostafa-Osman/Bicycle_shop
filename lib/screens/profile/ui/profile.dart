import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

class ProfileScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userData = ProfileCubit.get(context).userData!.data;

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
            color: black,
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
        child: Align(
          child: Container(
            width: 500,
            color: white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: black,
                              width: 1.3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: ClipOval(
                                child: Image.network(
                              userData!.image!,
                              height: 180,
                              width: 180,
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          userData.name!,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 20),
                        AccountTextFormField(
                          text: userData.phone!,
                          icon: Icons.phone,
                        ),
                        SizedBox(height: 3),
                        AccountTextFormField(
                          text: userData.email!,
                          icon: Icons.email,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: lightMainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          shape: BoxShape.rectangle,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(icon, color: mainColor),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: CustomText(
                    text: text,
                    fontSize: size.width >= 500 ? 18 : size.width / 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
