import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/auth/exceptions/phone_validation.dart';
import 'package:udemy_flutter/presentation/auth/register/cubit/register_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return Form(
          key: registerCubit.formKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Name',
                  fontSize: 15.0,
                ),
                const SizedBox(height: 5.0),
                CustomTextFormField(
                  controller: registerCubit.registerNameControl,
                  textInputAction: TextInputAction.next,
                  textHint: 'Enter your Name',
                  roundedRectangleBorder: 10.0,
                  backgroundColor: const Color(0xfff2f2f2),
                  prefix: const Icon(
                    Icons.account_circle_outlined,
                    color: mainColor,
                  ),
                  validator: (value) =>
                      (value!.isEmpty) ? 'Please Enter Your Name' : null,
                ),
                const SizedBox(height: 20.0),
                const CustomText(
                  text: 'Phone number',
                  fontSize: 15.0,
                ),
                const SizedBox(height: 5.0),
                CustomTextFormField(
                  controller: registerCubit.registerPhoneControl,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  textHint: 'Enter your Phone Number',
                  roundedRectangleBorder: 10.0,
                  backgroundColor: const Color(0xfff2f2f2),
                  prefix: const Icon(
                    Icons.phone_android,
                    color: mainColor,
                  ),
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter your phone number'
                        : (value.length != 11)
                            ? 'your number invalid enter valid number'
                            : !checkPhoneValidate(
                                phoneNumber: value,
                              )
                                ? 'this is number is not Egyptian number'
                                : null;
                  },
                ),
                const SizedBox(height: 20.0),
                const CustomText(text: 'E-mail', fontSize: 15.0),
                const SizedBox(height: 5.0),
                CustomTextFormField(
                  controller: registerCubit.registerEmailControl,
                  backgroundColor: const Color(0xfff2f2f2),
                  roundedRectangleBorder: 10.0,
                  textInputAction: TextInputAction.next,
                  textHint: "Enter your Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  prefix: const Icon(
                    Icons.email,
                    color: mainColor,
                  ),
                ),
                const SizedBox(height: 20.0),
                const CustomText(text: 'password', fontSize: 15.0),
                const SizedBox(height: 5.0),
                CustomTextFormField(
                  controller: registerCubit.registerPasswordControl,
                  backgroundColor: const Color(0xfff2f2f2),
                  roundedRectangleBorder: 10.0,
                  textHint: "Your password",
                  obscureText: registerCubit.isVisibility,
                  validator: (value) => (value!.isEmpty)
                      ? 'Please Enter Your password'
                      : (value.length < 6)
                          ? 'Please Enter valid password'
                          : null,
                  prefix: const Icon(
                    Icons.lock,
                    color: mainColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => registerCubit.visibilityPassword(),
                    icon: Icon(
                      (registerCubit.isVisibility)
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const CustomText(
                  text: 'Confirm password',
                  fontSize: 15.0,
                ),
                const SizedBox(height: 5.0),
                CustomTextFormField(
                  controller: registerCubit.registerConfirmPasswordControl,
                  backgroundColor: const Color(0xfff2f2f2),
                  roundedRectangleBorder: 10.0,
                  textHint: ' Rewrite password',
                  obscureText: registerCubit.confirmNotVisible,
                  prefix: const Icon(
                    Icons.lock,
                    color: mainColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => registerCubit.confirmVisibilityPassword(),
                    icon: registerCubit.confirmNotVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  validator: (value) => value!.isEmpty
                      ? 'please confirm password'
                      : (value != registerCubit.registerPasswordControl.text)
                          ? 'Password does not match'
                          : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
