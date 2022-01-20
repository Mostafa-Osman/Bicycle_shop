import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/screens/update_profile/ui/upload_pictures.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        // if (state is UpdateProfileSuccess)
        //   showToast(
        //       message: 'update profile success', state: ToastStates.SUCCESS);
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
    );
  }
}

class BodyEditProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userData = ProfileCubit.get(context).userData!.data;
    final nameController = TextEditingController(text: userData!.name);
    final emailController = TextEditingController(text: userData.email);
    final phoneController = TextEditingController(text: userData.phone);
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              UploadPictures(),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: ' Name',
                      fontSize: 20.0,
                      textColor: mainColor,
                    ),
                    SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: nameController,
                      backgroundColor: Color(0xfff2f2f2),
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
                      text: ' phone number',
                      textColor: mainColor,
                      fontSize: 20.0,
                    ),
                    SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: phoneController,
                      backgroundColor: Color(0xfff2f2f2),
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
                      text: ' E-mail',
                      textColor: mainColor,
                      fontSize: 20.0,
                    ),
                    SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: emailController,
                      backgroundColor: Color(0xfff2f2f2),
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
                    //  text to display password
                    // Padding(
                    //     padding: const EdgeInsets.only(
                    //         top: 20.0, left: 10.0, bottom: 5.0),
                    //     child: CustomText(
                    //       text: 'New password',
                    //       textColor: mainColor,
                    //       fontSize: 20.0,
                    //     )),
                    // // Text form field to enter password
                    // CustomTextFormField(
                    //     backgroundColor: Color(0xfff2f2f2),
                    //     controller: passwordController,
                    //     validator: (value) =>
                    //
                    //     (value!.isNotEmpty&&value.length < 6)
                    //             ? 'Please Enter valid password'
                    //             : null,
                    //     textHint: "New password",
                    //     hintColor: grey,
                    //     prefix: Icon(
                    //       Icons.lock,
                    //       color: mainColor,
                    //     ),
                    //     suffixIcon: IconButton(
                    //         onPressed: () => UpdateProfileCubit.get(context)
                    //             .visibilityPassword(),
                    //         icon: Icon(
                    //             (UpdateProfileCubit.get(context).isVisibility)
                    //                 ? Icons.visibility
                    //                 : Icons.visibility_off)),
                    //     obscureText:
                    //         UpdateProfileCubit.get(context).isVisibility),
                    //
                    // //  Text to  confirm password
                    // Padding(
                    //     padding: const EdgeInsets.only(
                    //         top: 20.0, left: 10.0, bottom: 5.0),
                    //     child: CustomText(
                    //       text: 'Confirm password',
                    //       textColor: mainColor,
                    //       fontSize: 20.0,
                    //     )),
                    // //  Text form field to confirm password
                    // CustomTextFormField(
                    //   textHint: ' confirm password',
                    //   controller: confirmPasswordController,
                    //   obscureText:
                    //       UpdateProfileCubit.get(context).confirmNotVisible,
                    //   backgroundColor: Color(0xfff2f2f2),
                    //   prefix: Icon(
                    //     Icons.lock,
                    //     color: mainColor,
                    //   ),
                    //   suffixIcon: IconButton(
                    //       onPressed: () => UpdateProfileCubit.get(context)
                    //           .confirmVisibilityPassword(),
                    //       icon:
                    //           UpdateProfileCubit.get(context).confirmNotVisible
                    //               ? Icon(Icons.visibility)
                    //               : Icon(Icons.visibility_off)),
                    //   validator: (value) =>  (value != passwordController.text)
                    //           ? 'Password does not match'
                    //           : null,
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UpdateProfileCubit.get(context).updateUserData(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      image: UpdateProfileCubit.get(context).imageProfile,
                      //password: passwordController.text
                    );
                    Navigator.pop(context);
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
