import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/update_profile/widgets/update_user_data.dart';
import 'package:udemy_flutter/presentation/update_profile/widgets/upload_pictures.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Edit Profile',
          textColor: mainColor,fontSize: 20.0,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
