import 'package:flutter/material.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
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
    );
  }
}
