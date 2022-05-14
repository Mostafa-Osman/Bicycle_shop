import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/auth/register/widgets/already_have_account.dart';
import 'package:udemy_flutter/presentation/auth/register/widgets/register_button.dart';
import 'package:udemy_flutter/presentation/auth/register/widgets/register_form.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 140.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background_login.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                RegisterForm(),
                SizedBox(height: 30.0),
                RegisterButton(),
                SizedBox(height: 10.0),
                SignIn(),
              ],
            ),
          ),
        ),

    );
  }
}
