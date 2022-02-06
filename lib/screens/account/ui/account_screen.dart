import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/account/widgets/about_us.dart';
import 'package:udemy_flutter/screens/account/widgets/contact_us.dart';
import 'package:udemy_flutter/screens/account/widgets/f_a_q.dart';
import 'package:udemy_flutter/screens/account/widgets/language.dart';
import 'package:udemy_flutter/screens/account/widgets/points_wallet.dart';
import 'package:udemy_flutter/screens/account/widgets/profile_details.dart';
import 'package:udemy_flutter/screens/account/widgets/sign_out.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/loading.dart';



class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
              condition: (state is ProfileSuccess),
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // profile
                        ProfileDetails(),
                        SizedBox(height: 20.0),
                        //Points And Wallet
                        PointsAndWallet(),
                        CustomCard(
                          widget: Column(
                            children: [
                              //contact us
                              ContactUs(),
                              CustomDotedLine(),
                              //about us
                              AboutUS(),
                              CustomDotedLine(),
                              //F A Q
                              FAQ(),
                              CustomDotedLine(),
                              // language
                              Language()
                            ],
                          ),
                        ),
                        //sign out
                        SignOut(),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                );
              },
              fallback: (BuildContext context) => Center(child: CustomLoading()),
            );
          })
    ;
  }
}
