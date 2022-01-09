import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/screens/login/login_cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_from_field.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/network/locial/cache_helper.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status) {
            CacheHelper.saveData(
                    key: 'token', value: state.loginModel.data!.token)
                .then((value) {
              token = state.loginModel.data!.token;
              navigatorAndFinish(context, RouteConstant.shopLayoutRoute);
            });
          } else {
            print(state.loginModel.message);
            showToast(
                state: ToastStates.ERROR, message: state.loginModel.message);
          }
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                right: 20.0, left: 20.0, bottom: 20.0, top: 50.0),
            child:  Column(
                children: [
                  Image.asset(
                    "assets/images/login.jpg",
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFromField(
                          controller: emailController,
                          backgroundColor: HexColor("#f2f2f2"),
                          textHint: "Your Email",
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Please Enter Your Email';
                            else if (!value.contains('@'))
                              return 'Please Enter valid Email';
                          },
                          prefix: Icon(
                            Icons.account_circle,
                            color: HexColor('#AF4537'),
                          ),
                        ),
                        SizedBox(height: 20),

                        // TextFieldContainer to take password from user
                        CustomTextFromField(
                            controller: passwordController,
                            backgroundColor: HexColor("#f2f2f2"),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Please Enter Your password';
                              else if (value.length < 6)
                                return 'Please Enter valid password';
                            },
                            textHint: "Your password",
                            prefix: Icon(
                              Icons.lock,
                              color:HexColor('#AF4537'),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () => LoginCubit.get(context)
                                    .visibilityPassword(),
                                icon: Icon(
                                    (LoginCubit.get(context).isVisibility)
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                            obscureText: LoginCubit.get(context).isVisibility),
                        //GestureDetector action when click in text forget password ?
                        CustomTextButton(
                          text: 'forget password ?',
                          textColor: black,
                          onPress: () {},
                          //    textAlign: TextAlign.right
                        ),

                        //button login
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 50.0),
                          child: ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => CustomButton(
                              width: double.infinity,
                              text: 'Login',
                              fontSize: 20,
                              onPressed: () {
                                if (_formKey.currentState!.validate())
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                              },
                              buttonColor: HexColor('#AF4537'),
                            ),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "Don't have an Account?", fontSize: 15),
                            CustomTextButton(
                                text: 'Sign Up',
                                textColor: HexColor('#AF4537'),
                                fontSize: 20,
                                onPress: () => navigateTo(
                                    context, RouteConstant.registerRoute))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
