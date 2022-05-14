import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
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
    );
  }
}
