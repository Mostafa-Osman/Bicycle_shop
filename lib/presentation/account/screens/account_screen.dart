import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/account/widgets/about_us.dart';
import 'package:udemy_flutter/presentation/account/widgets/contact_us.dart';
import 'package:udemy_flutter/presentation/account/widgets/f_a_q.dart';
import 'package:udemy_flutter/presentation/account/widgets/language.dart';
import 'package:udemy_flutter/presentation/account/widgets/points_wallet.dart';
import 'package:udemy_flutter/presentation/account/widgets/profile_details.dart';
import 'package:udemy_flutter/presentation/account/widgets/sign_out.dart';
import 'package:udemy_flutter/presentation/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait(
          [BlocProvider.of<ProfileCubit>(context).getUserData()],
        );
      },
      child: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          if (state is ProfileError) {
            return NetworkDisconnected(
              onPress: () {
                BlocProvider.of<ProfileCubit>(context).getUserData();
              },
            );
          } else if (state is ProfileLoading) {
            return const Center(child: CustomLoading());
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      // profile
                      ProfileDetails(),
                      const SizedBox(height: 10.0),
                      //Points And Wallet

                      PointsAndWallet(),
                      const SizedBox(height: 10.0),

                      CustomCard(
                        height: 305.0,
                        width: double.infinity,
                        widget: Column(
                          children: [
                            //contact us
                            ContactUs(),
                            const CustomDotedLine(),
                            //about us
                            AboutUS(),
                            const CustomDotedLine(),
                            //F A Q
                            FAQ(),
                            const CustomDotedLine(),
                            // language
                            Language()
                          ],
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      //sign out
                      SignOut(),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
