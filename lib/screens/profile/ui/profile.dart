import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userData = ProfileCubit.get(context).userData!.data;
        return ConditionalBuilder(
          condition: (ProfileCubit.get(context).userData!=null),
          builder: (context) => SingleChildScrollView(
            child: Align(
              //alignment: Alignment.topCenter,
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
                            AccountTextFormField(
                              text: userData.points.toString(),
                              icon: Icons.account_balance_wallet,
                            ),
                            AccountTextFormField(
                              text: userData.credit.toString(),
                              icon: Icons.view_compact_outlined,
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
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: red,
          )),
        );
      },
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
