import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/presentation/update_profile/widgets/update_user_data.dart';
import 'package:udemy_flutter/presentation/update_profile/widgets/upload_pictures.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';


class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess)
            showToast(
                message: 'update profile success', state: ToastStates.SUCCESS);
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: CustomText(
                  text: 'Edit Profile',
                  textColor: mainColor,
                  textAlign: TextAlign.center,
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
                ),
                backgroundColor: white,
                elevation: 0,
              ),
              body: BodyEditProfile());
        },
      )
    ;
  }
}

class BodyEditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //upload photo
              UploadPictures(),
              //enter user data name phone email
              UpdateUserData(),
            ],
          ),
        ),
      ),
    );
  }
}
