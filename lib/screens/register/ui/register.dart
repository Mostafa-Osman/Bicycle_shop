import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_from_field.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

import '../cubit/recubit.dart';
import '../cubit/restates.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var registerNameControl = TextEditingController();
  var registerEmailControl = TextEditingController();
  var registerPasswordControl = TextEditingController();
  var registerPhoneControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, ShopRegisterStates>(
        listener: (context, state) => {},
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Container(
              //design background of page (container)
              padding: EdgeInsets.all(25),

              margin: EdgeInsets.all(50),

              decoration: BoxDecoration(
                //background color
                color: Colors.lightBlueAccent,

                //shape of background (container)
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(120),
                    bottomLeft: Radius.circular(120)),
              ),

              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // text sign up
                    CustomText(text: 'Sign UP!', textColor: Colors.purple),

                    SizedBox(height: 36),

                    // object of textFieldRegister to make text field (take name of user)
                    CustomTextFromField(
                        controller: registerNameControl,
                        textHint: 'Name',
                        hintColor: Colors.grey,
                        prefix: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.blue,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Please Enter Your Name';
                          return null;
                        }),

                    SizedBox(height: 10),

                    //another text field for email
                    CustomTextFromField(
                        controller: registerEmailControl,
                        textHint: 'Email',
                        hintColor: Colors.grey,
                        prefix: Icon(Icons.email_outlined, color: Colors.blue),
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please Enter Your Email';
                          else if (!value.contains('@'))
                            return 'Please Enter Valid Email';
                          return null;
                        }
                        ),

                    SizedBox(height: 10),

                    CustomTextFromField(
                        controller: registerPasswordControl,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please Enter Your password';
                          else if (value.length < 6)
                            return 'Please Enter valid password';
                        },
                        textHint: "Your password",
                        hintColor: Colors.grey,
                        prefix: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () => RegisterCubit.get(context)
                                .visibilityPassword(),
                            icon: Icon(
                                (RegisterCubit.get(context).isVisibility)
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                        obscureText:
                            RegisterCubit.get(context).isVisibility),

                    SizedBox(height: 10),

                    //phone Number
                    CustomTextFromField(
                        controller: registerPhoneControl,
                        keyboardType: TextInputType.phone,
                        textHint: 'Your Phone Number',
                        hintColor: Colors.grey,
                        prefix: Icon(Icons.phone_android, color: Colors.blue),
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please Enter Your Email';
                          else if (value.length != 9)
                            return 'Please Enter Valid Number';
                          return null;
                        }),
                    SizedBox(height: 30),

                    // button create account

                    CustomButton(
                        width: 200,

                        text: ' Create Account',

                        // textFontSize: 20,

                        onPressed: () {
                          if (_formKey.currentState!.validate())
                            RegisterCubit.get(context).userRegister(
                                name: registerNameControl.text,
                                email: registerEmailControl.text,
                                password: registerPasswordControl.text,
                                phone: registerPhoneControl.text);
                        },
                        buttonColor: Colors.deepPurple),

                    SizedBox(height: 30),

                    //text already have an account

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "Already have an Account ?", fontSize: 13),
                        CustomTextButton(
                            text: ' Sign In',
                            textColor: Colors.purple,
                            fontSize: 20,
                            onPress: () => navigateTo(context, RouteConstant.loginRoute))
                      ],
                    ),

                    SizedBox(height: 30),

                    //sign in with facebook or twitter or google plus
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        option("assets/icons/facebook.svg", () {}),
                        SizedBox(
                          width: 10,
                        ),
                        option("assets/icons/googlePlus.svg", () {}),
                        SizedBox(
                          width: 10,
                        ),
                        option("assets/icons/twitter.svg", () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget option(String url, Function press) {
  return IconButton(
    onPressed: () => press(),
    icon: SvgPicture.asset(
      url,
      height: 30,
      width: 30,
    ),
  );
}
