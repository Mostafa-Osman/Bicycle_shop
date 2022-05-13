import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/components/toast.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class UpdateUserData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final updateProfileCubit = BlocProvider.of<UpdateProfileCubit>(context);
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileError) {
          showToast(message:state.message, state: ToastStates.error);
        } else if (state is UpdateProfileSuccess) {
          BlocProvider.of<ProfileCubit>(context).getUserData();
          showToast(
            message: 'update profile success',
            state: ToastStates.success,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
              child: Form(
                key: updateProfileCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: ' Name',
                      fontSize: 15.0,
                      textColor: mainColor,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller:updateProfileCubit.nameController,
                      roundedRectangleBorder: 10.0,
                      backgroundColor: const Color(0xfff2f2f2),
                      prefix: const Icon(
                        Icons.account_circle_outlined,
                        color: mainColor,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'please enter your name' : null,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: ' phone number',
                      textColor: mainColor,
                      fontSize: 15.0,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: updateProfileCubit.phoneController,
                      roundedRectangleBorder: 10.0,
                      backgroundColor: const Color(0xfff2f2f2),
                      prefix: const Icon(
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
                    const SizedBox(height: 20),
                    const CustomText(
                      text: ' E-mail',
                      textColor: mainColor,
                      fontSize: 15.0,
                    ),
                    const SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: updateProfileCubit.emailController,
                      roundedRectangleBorder: 10.0,
                      backgroundColor: const Color(0xfff2f2f2),
                      prefix: const Icon(
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

          ],
        );
      },
    );
  }
}
