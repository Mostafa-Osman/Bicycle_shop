import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.22,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Form(
            key: loginCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: loginCubit.emailController,
                  backgroundColor: const Color(0xfff2f2f2),
                  roundedRectangleBorder: 10.0,
                  textInputAction: TextInputAction.next,
                  textHint: "Your Email",
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
                    Icons.account_circle,
                    color: Color(0xffAF4537),
                  ),
                ),
                const SizedBox(height: 20),

                // TextFieldContainer to take password from user
                CustomTextFormField(
                  controller: loginCubit.passwordController,
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
                    onPressed: () => loginCubit.visibilityPassword(),
                    icon: Icon(
                      (loginCubit.isVisibility)
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureText: loginCubit.isVisibility,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
