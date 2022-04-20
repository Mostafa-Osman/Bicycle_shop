import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/profile/widgets/profile_photo.dart';
import 'package:udemy_flutter/presentation/profile/widgets/user_data.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        title: const CustomText(
          text: 'Profile',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              width: 500,
              color: white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    //profile photo
                    ProfilePhoto(),
                    //user data (name,email phone)
                    UserDataWidget(),
                    const SizedBox(height: 20.0),
                    //profile address
                    // ProfileAddress(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 8.0),
                      child: CustomCard(
                        paddingLeft: 0.0,
                        width: double.infinity,
                        widget: Column(
                          children: [
                            ListTile(
                              onTap: () => navigateTo(
                                context,
                                RouteConstant.updateProfileRoute,
                              ),
                              title: const CustomText(
                                text: 'Edit profile',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              subtitle: const CustomText(
                                text: 'Tap to edit user information',
                                fontSize: 12,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: mainColor,
                                size: 25.0,
                              ),
                            ),
                            const CustomDotedLine(),
                            ListTile(
                              onTap: () => navigateTo(
                                context,
                                RouteConstant.myAddressRoute,
                              ),
                              title: const CustomText(
                                text: 'Add and edit address',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              subtitle: const CustomText(
                                text: 'Tap to add ,delete and update address',
                                fontSize: 12,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: mainColor,
                                size: 25.0,
                              ),
                            ),
                            const CustomDotedLine(),
                            const ListTile(
                              title: CustomText(
                                text: 'change password',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              subtitle: CustomText(
                                text: 'Tap to reset password',
                                fontSize: 12,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: mainColor,
                                size: 25.0,
                              ),
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
      ),
    );
  }
}
