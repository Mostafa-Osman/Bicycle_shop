import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import '../cubit/recubit.dart';
import '../cubit/restates.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/background_login.png",
                ),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 140.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  text to display name
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 5.0),
                              child: CustomText(text: 'Name', fontSize: 20),
                            ),
                            // object of textFieldRegister to make text field (take name of user)
                            CustomTextFormField(
                              controller: registerNameControl,
                              textHint: 'Enter your Name',
                              hintColor: grey,
                              backgroundColor: HexColor("#f2f2f2"),
                              prefix: Icon(
                                Icons.account_circle_outlined,
                                color: HexColor('#AF4537'),
                              ),
                              validator: (value) => (value!.isEmpty)
                                  ? 'Please Enter Your Name'
                                  : null,
                            ),

                            //  text phone number
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0, bottom: 5.0),
                                child: CustomText(
                                    text: 'Phone number', fontSize: 20)),
                            CustomTextFormField(
                              controller: registerPhoneControl,
                              keyboardType: TextInputType.phone,
                              textHint: 'Enter your Phone Number',
                              hintColor: grey,
                              backgroundColor: HexColor("#f2f2f2"),
                              prefix: Icon(Icons.phone_android,
                                  color: HexColor('#AF4537')),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your phone number'
                                  : (value.length != 9)
                                      ? 'your number invalid enter valid number'
                                      : null,
                            ),

                            //  text to display email
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0, bottom: 5.0),
                                child:
                                    CustomText(text: 'E-mail', fontSize: 20)),
                            //another text field for email
                            CustomTextFormField(
                              controller: registerEmailControl,
                              backgroundColor: HexColor("#f2f2f2"),
                              textHint: "Enter your Email",
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Please Enter Your Email';
                                else if (!value.contains('@'))
                                  return 'Please Enter Valid Email';
                                return null;
                              },
                              prefix: Icon(
                                Icons.email,
                                color: HexColor('#AF4537'),
                              ),
                            ),

                            //  text to display password
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0, bottom: 5.0),
                                child:
                                    CustomText(text: 'password', fontSize: 20)),
                            // Text form field to enter password
                            CustomTextFormField(
                                backgroundColor: HexColor("#f2f2f2"),
                                controller: registerPasswordControl,
                                validator: (value) => (value!.isEmpty)
                                    ? 'Please Enter Your password'
                                    : (value.length < 6)
                                        ? 'Please Enter valid password'
                                        : null,
                                textHint: "Your password",
                                hintColor: grey,
                                prefix: Icon(
                                  Icons.lock,
                                  color: HexColor('#AF4537'),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () => RegisterCubit.get(context)
                                        .visibilityPassword(),
                                    icon: Icon((RegisterCubit.get(context)
                                            .isVisibility)
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                obscureText:
                                    RegisterCubit.get(context).isVisibility),

                            //  Text to  confirm password
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0, bottom: 5.0),
                                child: CustomText(
                                    text: 'Confirm password', fontSize: 20)),
                            //  Text form field to confirm password
                            CustomTextFormField(
                              textHint: ' Rewrite password',
                              controller: registerConfirmPasswordControl,
                              obscureText: cubit.confirmNotVisible,
                              backgroundColor: HexColor("#f2f2f2"),
                              prefix: Icon(
                                Icons.lock,
                                color: HexColor('#AF4537'),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () =>
                                      cubit.confirmVisibilityPassword(),
                                  icon: cubit.confirmNotVisible
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              validator: (value) => value!.isEmpty
                                  ? 'please confirm password'
                                  : (value != registerPasswordControl.text)
                                      ? 'Password does not match'
                                      : null,
                            ),
                            // Sized Box
                            SizedBox(height: 30),
                            // button to submit register
                            CustomButton(
                              text: 'submit',
                              buttonColor: HexColor('#AF4537'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      name: registerNameControl.text,
                                      email: registerEmailControl.text,
                                      password: registerPasswordControl.text,
                                      phone: registerPhoneControl.text);
                                  navigateTo(context, RouteConstant.loginRoute);
                                }
                              },
                            ),
                            // Sized Box
                            SizedBox(height: 10),
                            // Text button class to   navigate to login page if you have account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: "Already have an Account ?",
                                    fontSize: 13),
                                CustomTextButton(
                                    text: ' Sign In',
                                    textColor: HexColor('#AF4537'),
                                    fontSize: 20,
                                    onPress: () => navigateTo(
                                        context, RouteConstant.loginRoute))
                              ],
                            ),
                          ]),
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
