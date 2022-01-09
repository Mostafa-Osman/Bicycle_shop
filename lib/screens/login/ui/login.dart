import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            padding: const EdgeInsets.all(30.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                //design in top left of page (image)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: size.width * 0.3,
                  ),
                ),
                //design in bottom right of page (image)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login.png",
                    width: size.width * 0.2,
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //icons
                      SvgPicture.asset(
                        "assets/icons/login.svg",
                        height: size.height * 0.45,
                      ),

                      CustomTextFromField(
                        controller: emailController,
                        backgroundColor: Colors.purpleAccent,
                        textHint: "Your Email",
                        // hintColor: Colors.grey,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please Enter Your Email';
                          else if (!value.contains('@'))
                            return 'Please Enter valid Email';
                        },
                        prefix: Icon(
                          Icons.account_circle,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      // TextFieldContainer to take password from user
                      CustomTextFromField(
                          controller: passwordController,
                          backgroundColor: Colors.purpleAccent,
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Please Enter Your password';
                            else if (value.length < 6)
                              return 'Please Enter valid password';
                          },
                          textHint: "Your password",
                          // hintColor: Colors.grey,
                          prefix: Icon(
                            Icons.lock,
                            color: Color.fromRGBO(0, 0, 128, 1),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  LoginCubit.get(context).visibilityPassword(),
                              icon: Icon((LoginCubit.get(context).isVisibility)
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          obscureText: LoginCubit.get(context).isVisibility),
                      //GestureDetector action when click in text forget password ?
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          text: 'forget password ?',
                          onPress: () {},
                          //    textAlign: TextAlign.right
                        ),
                      ),

                      //button login
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => CustomButton(
                            width: size.width * 0.3,
                            height: size.height * 0.06,
                            text: 'Login',
                            fontSize: 20,

                            onPressed: () {
                              if (_formKey.currentState!.validate())
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                            },
                            buttonColor: Colors.deepPurple),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Don't have an Account?", fontSize: 15),
                          CustomTextButton(
                              text: 'Sign Up',
                              textColor: Colors.blue,
                              fontSize: 20,
                              onPress: () =>
                                  navigateTo(context, RouteConstant.registerRoute))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
