import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
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
              var userData = ProfileCubit.get(context).userData!.data;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        // profile
                        InkWell(
                          child: CustomCard(
                            widget: ListTile(
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
                                  textColor: mainColor),
                              subtitle: CustomText(
                                text: '${userData.phone}',
                                fontSize: 15,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_outlined,
                                  color: mainColor),
                            ),
                          ),
                          onTap: () =>
                              navigateTo(context, RouteConstant.profileRoute),
                        ),
                        //points
                        CustomCard(
                          widget: ListTile(
                            leading: SvgPicture.asset('assets/icons/points.svg',
                                fit: BoxFit.cover, height: 30, width: 30),
                            title: CustomText(
                                text: 'Membership points',
                                fontSize: 20,
                                textColor: mainColor),
                            subtitle: CustomText(
                                text: '${userData.points}points', fontSize: 15),
                          ),
                        ),

                        // wallet
                        CustomCard(
                          widget: Column(
                            children: [
                              ListTile(
                                leading: SvgPicture.asset(
                                    'assets/icons/wallet.svg',
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30),
                                title: CustomText(
                                    text: 'Cash Wallet',
                                    fontSize: 20,
                                    textColor: mainColor),
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
                                onTap: () {},
                                child: ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/icons/contact_us.svg',
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30),
                                  title: CustomText(
                                      text: 'Contact Us',
                                      fontSize: 20,
                                      textColor: mainColor),
                                  subtitle: CustomText(
                                      text: 'Tap to view contact information',
                                      fontSize: 15),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: mainColor),
                                ),
                              ),
                              //about us
                              InkWell(
                                onTap: () {},
                                child: ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/icons/about us.svg',
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30),
                                  title: CustomText(
                                      text: 'About Us',
                                      fontSize: 20,
                                      textColor: mainColor),
                                  subtitle: CustomText(
                                      text: 'Terms of use', fontSize: 15),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: mainColor),
                                ),
                              ),
                              //F A Q
                              InkWell(
                                onTap: () {},
                                child: ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/icons/questions.svg',
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30),
                                  title: CustomText(
                                      text: 'F A Q',
                                      fontSize: 20,
                                      textColor: mainColor),
                                  subtitle: CustomText(
                                      text: 'Answers of popular questions',
                                      fontSize: 15),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: mainColor),
                                ),
                              ),
                              // language
                              InkWell(
                                onTap: () {},
                                child: ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/icons/language.svg',
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30),
                                  title: CustomText(
                                      text: 'Language',
                                      fontSize: 20,
                                      textColor: mainColor),
                                  subtitle:
                                      CustomText(text: 'English', fontSize: 15),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: mainColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //sign out
                        InkWell(
                          onTap: () {},
                          child: CustomCard(
                            widget: Column(
                              children: [
                                ListTile(
                                  title: CustomText(
                                      text: 'Sign out', textColor: red),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
