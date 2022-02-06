import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class UpdateUserData extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userInformation = userData!.data;
    final nameController = TextEditingController(text: userInformation!.name);
    final emailController = TextEditingController(text: userInformation.email);
    final phoneController = TextEditingController(text: userInformation.phone);
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
      if (state is UpdateProfileError)
        showToast(message: state.error, state: ToastStates.ERROR);
      else if (state is UpdateProfileSuccess){
        showToast(
            message: 'update profile success', state: ToastStates.SUCCESS);

        Navigator.pop(context);
      }

    }, builder: (context, state) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
            child: Form(
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
                ],
              ),
            ),
          ),
          //save new user data
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                UpdateProfileCubit.get(context).updateUserData(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  image: UpdateProfileCubit.get(context).imageProfile,
                );
              }
            },
            text: 'save change',
          ),
        ],
      );
    });
  }
}
