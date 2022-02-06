import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';

import 'item_account_text_from_field.dart';

class UserDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userInformation = userData!.data!;

    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if(state is UpdateProfileSuccess)
          {
            userInformation.name=state.userModel.data!.name;
            userInformation.email=state.userModel.data!.email;
            userInformation.phone=state.userModel.data!.phone;
          }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: CustomText(
                  text: userInformation.name!, overflow: TextOverflow.clip),
            ),
            AccountTextFormField(
              text: userInformation.phone!,
              icon: Icons.phone,
            ),
            AccountTextFormField(
              text: userInformation.email!,
              icon: Icons.email,
            )
          ],
        );
      },
    );
  }
}
