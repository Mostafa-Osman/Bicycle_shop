import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: (state is ProfileSuccess),
            builder: (context) {
              var userData = ProfileCubit
                  .get(context)
                  .userData!
                  .data;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // profile
                      InkWell(
                        child: CustomCard(
                          widget: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: ClipOval(
                                  child: Image.network(
                                    userData!.image!,
                                    height: 150,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  )),
                              title: CustomText(
                                text: '${userData.name}',
                                fontSize: 20,
                              ),
                              subtitle: CustomText(
                                text: '${userData.phone}',
                                fontSize: 15,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_outlined,
                                  color: mainColor),
                            ),
                          ),
                        ),
                        onTap: () =>
                            navigateTo(context, RouteConstant.profileRoute),
                      ),
                      SizedBox(height: 20.0),

                      CustomCard(
                        widget: Column(
                          children: [
                            //points
                            ListTile(
                              leading: SvgPicture.asset(
                                  'assets/icons/points.svg',
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30),
                              title: CustomText(
                                text: 'Membership points',
                                fontSize: 20,
                              ),
                              subtitle: CustomText(
                                  text: '${userData.points}points',
                                  fontSize: 15),
                            ),
                            CustomDotedLine(),
                            // wallet

                            ListTile(
                              leading: SvgPicture.asset(
                                  'assets/icons/wallet.svg',
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30),
                              title:
                              CustomText(text: 'Cash Wallet', fontSize: 20),
                              subtitle: CustomText(
                                  text: userData.credit.toString() + ' \$',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),

                      CustomCard(
                        widget: Column(
                          children: [
                            //contact us
                            InkWell(
                              onTap: () =>
                                  navigateTo(
                                      context, RouteConstant.contactsRoute),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                    'assets/icons/contact_us.svg',
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30),
                                title: CustomText(
                                    text: 'Contact Us', fontSize: 20),
                                subtitle: CustomText(
                                    text: 'Tap to view contact information',
                                    fontSize: 15),
                                trailing: Icon(Icons.arrow_forward_ios_outlined,
                                    color: mainColor),
                              ),
                            ),
                            CustomDotedLine(),

                            //about us
                            InkWell(
                              onTap: () =>
                                  navigateTo(context, RouteConstant.aboutRoute),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                    'assets/icons/about_us_icon.svg',
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30),
                                title:
                                CustomText(text: 'About Us', fontSize: 20),
                                subtitle: CustomText(
                                    text: 'Terms of use', fontSize: 15),
                                trailing: Icon(Icons.arrow_forward_ios_outlined,
                                    color: mainColor),
                              ),
                            ),
                            CustomDotedLine(),

                            //F A Q
                            InkWell(
                              onTap: () =>
                                  navigateTo(
                                      context, RouteConstant.questionsRoute),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                    'assets/icons/questions.svg',
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30),
                                title: CustomText(text: 'F A Q', fontSize: 20),
                                subtitle: CustomText(
                                    text: 'Answers of popular questions',
                                    fontSize: 15),
                                trailing: Icon(Icons.arrow_forward_ios_outlined,
                                    color: mainColor),
                              ),
                            ),
                            CustomDotedLine(),

                            // language
                            InkWell(
                              onTap: () =>
                                  navigateTo(
                                      context, RouteConstant.languageRoute),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                    'assets/icons/language.svg',
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30),
                                title:
                                CustomText(text: 'Language', fontSize: 20),
                                subtitle:
                                CustomText(text: 'English', fontSize: 15),
                                trailing: Icon(Icons.arrow_forward_ios_outlined,
                                    color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //sign out
                      InkWell(
                        onTap: ()=>signOut(context),
                        child: CustomCard(
                          widget: Column(
                            children: [
                              ListTile(
                                title: CustomText(
                                    text: 'Sign out', textColor: red),
                                trailing: Icon(Icons.logout, color: red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              );
            },
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          );
        });
  }
}
