import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/data_sources/local/cache_helper.dart';
import 'package:udemy_flutter/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.data.token,
            ).then((value) {
              token = state.loginModel.data.token;
              navigatorAndFinish(context, RouteConstant.shopLayoutRoute);
            });
          }
        } else if (state is LoginErrorState) {
          showToast(state: ToastStates.error, message: state.error);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
            child: Stack(
              children: [
                //logo
                Padding(
                  padding:
                      const EdgeInsets.only(top: 100.0, right: 60, left: 60),
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: emailController,
                              backgroundColor: const Color(0xfff2f2f2),
                              roundedRectangleBorder: 10.0,
                              textInputAction: TextInputAction.next,
                              textHint: "Your Email",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Email';
                                } else if (!value.contains('@')) {
                                  return 'Please Enter Valid Email';
                                }
                                return null;
                              },
                              prefix: const Icon(
                                Icons.account_circle,
                                color: Color(0xffAF4537),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // TextFieldContainer to take password from user
                            CustomTextFormField(
                              controller: passwordController,
                              backgroundColor: const Color(0xfff2f2f2),
                              roundedRectangleBorder: 10.0,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your password';
                                } else if (value.length < 6) {
                                  return 'Please Enter valid password';
                                }
                                return null;
                              },
                              textHint: "Your password",
                              prefix: const Icon(
                                Icons.lock,
                                color: Color(0xffAF4537),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    loginCubit.visibilityPassword(),
                                icon: Icon(
                                  (loginCubit.isVisibility)
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              obscureText: loginCubit.isVisibility,
                            ),
                            //GestureDetector action when click in text forget password ?

                            // TextButton(
                            //   child: const Text(
                            //     'forget password ?',
                            //     style: TextStyle(
                            //       fontSize: 20,
                            //       color: black,
                            //     ),
                            //   ),
                            //   onPressed: () {},
                            // ),

                            //button login
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40.0,
                                bottom: 15.0,
                              ),
                              child: ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (context) => CustomButton(
                                  text: 'Login',
                                  onPressed: () {
                                    BlocProvider.of<LayoutCubit>(context)
                                        .changeCurrentIndex(2);
                                    if (_formKey.currentState!.validate()) {
                                      loginCubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                ),
                                fallback: (context) =>
                                    const Center(child: CustomLoading()),
                              ),
                            ),

                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomText(
                                    text: "Don't have an Account?",
                                    fontSize: 15,
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: mainColor,
                                        fontFamily: 'RobotoSerif',

                                      ),
                                    ),
                                    onPressed: () => navigateTo(
                                      context,
                                      RouteConstant.registerRoute,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
