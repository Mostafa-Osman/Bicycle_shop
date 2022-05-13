import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/auth/exceptions/phone_validation.dart';
import 'package:udemy_flutter/presentation/auth/register/cubit/register_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/toast.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is ShopRegisterErrorState) {
          showToast(state: ToastStates.error, message: state.error);
        } else if (state is ShopRegisterSuccessState) {
          showToast(state: ToastStates.success, message: 'Register success');
          navigateTo(context, RouteConstant.loginRoute);
        }
      },
      builder: (context, state) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background_login.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 140.0),
              child: Column(
                children: [
                  Form(
                    key: registerCubit.formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  text to display name
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10.0,
                              bottom: 5.0,
                            ),
                            child: CustomText(
                              text: 'Name',
                              fontSize: 15.0,
                            ),
                          ),
                          // object of textFieldRegister to make text field (take name of user)
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
                            validator: (value) => (value!.isEmpty)
                                ? 'Please Enter Your Name'
                                : null,
                          ),

                          //  text phone number
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              left: 10.0,
                              bottom: 5.0,
                            ),
                            child: CustomText(
                              text: 'Phone number',
                              fontSize: 15.0,
                            ),
                          ),
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

                          //  text to display text email
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              left: 10.0,
                              bottom: 5.0,
                            ),
                            child: CustomText(text: 'E-mail', fontSize: 15.0),
                          ),
                          //another text field for email
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
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",)
                                  .hasMatch(value)) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                            prefix: const Icon(
                              Icons.email,
                              color: mainColor,
                            ),
                          ),

                          //  text to display text password
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              left: 10.0,
                              bottom: 5.0,
                            ),
                            child: CustomText(text: 'password', fontSize: 15.0),
                          ),
                          // Text form field to enter password
                          CustomTextFormField(
                            backgroundColor: const Color(0xfff2f2f2),
                            roundedRectangleBorder: 10.0,
                            textInputAction: TextInputAction.next,
                            controller: registerCubit.registerPasswordControl,
                            validator: (value) => (value!.isEmpty)
                                ? 'Please Enter Your password'
                                : (value.length < 6)
                                    ? 'Please Enter valid password'
                                    : null,
                            textHint: "Your password",
                            prefix: const Icon(
                              Icons.lock,
                              color: mainColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => RegisterCubit.get(context)
                                  .visibilityPassword(),
                              icon: Icon(
                                (RegisterCubit.get(context).isVisibility)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            obscureText:
                                RegisterCubit.get(context).isVisibility,
                          ),

                          //  Text to  confirm password
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              left: 10.0,
                              bottom: 5.0,
                            ),
                            child: CustomText(
                              text: 'Confirm password',
                              fontSize: 15.0,
                            ),
                          ),
                          //  Text form field to confirm password
                          CustomTextFormField(
                            textHint: ' Rewrite password',
                            controller:
                                registerCubit.registerConfirmPasswordControl,
                            textInputAction: TextInputAction.done,
                            obscureText: registerCubit.confirmNotVisible,
                            backgroundColor: const Color(0xfff2f2f2),
                            roundedRectangleBorder: 10.0,
                            prefix: const Icon(
                              Icons.lock,
                              color: mainColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  registerCubit.confirmVisibilityPassword(),
                              icon: registerCubit.confirmNotVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'please confirm password'
                                : (value !=
                                        registerCubit
                                            .registerPasswordControl.text)
                                    ? 'Password does not match'
                                    : null,
                          ),
                          // button to submit register
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30.0,
                              bottom: 10.0,
                            ),
                            child: CustomButton(
                              text: 'submit',
                              onPressed: () {
                                if (registerCubit.formKey.currentState!
                                    .validate()) {
                                  RegisterCubit.get(context).userRegister();
                                }
                              },
                            ),
                          ),
                          // Text button class to   navigate to login page if you have account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "Already have an Account ?",
                                fontSize: 13,
                              ),
                              TextButton(
                                child: const Text(
                                  ' Sign In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: mainColor,
                                    fontFamily: 'RobotoSerif',
                                  ),
                                ),
                                onPressed: () => navigateTo(
                                  context,
                                  RouteConstant.loginRoute,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
