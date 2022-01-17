import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // cubit.setEditPageController();
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
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
    );
  }
}

class BodyEditProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userData = ProfileCubit.get(context).userData!.data;
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: ' Name : ',
                      fontSize: 20.0,
                      textColor: mainColor,
                    ),
                    SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: nameController,
                      prefix: Icon(
                        Icons.account_circle_outlined,
                        color: mainColor,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'please enter your name' : null,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: ' phone number : ',
                      textColor: mainColor,
                      fontSize: 20.0,
                    ),
                    SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: numberController,
                      prefix: Icon(
                        Icons.phone,
                        color: mainColor,
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty
                          ? 'من فضلك ادخل رقم هاتفك'
                          : (value.length != 11)
                              ? 'رقم الهاتف غير صحيح'
                              : null,
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: ' E-mail ',
                      textColor: mainColor,
                      fontSize: 20.0,
                    ),
                    SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: emailController,
                      prefix: Icon(
                        Icons.email,
                        color: mainColor,
                      ),
                      validator: (value) =>
                          (value!.isEmpty || !value.contains('@'))
                              ? 'Invalid email enter valid email please '
                              : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // cubit.setEditPageDetails();
                    // Navigator.pop(context);
                  }
                },
                text: 'save change',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
