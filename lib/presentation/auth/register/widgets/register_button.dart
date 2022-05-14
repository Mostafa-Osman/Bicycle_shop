import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/auth/register/cubit/register_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/toast.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit =  BlocProvider.of<RegisterCubit>(context);

    return  BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is ShopRegisterErrorState) {
          showToast(state: ToastStates.error, message: state.error);
        } else if (state is ShopRegisterSuccessState) {
          showToast(state: ToastStates.success, message: 'Register success');
          navigateTo(context, RouteConstant.loginRoute);
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: CustomButton(
          text: 'submit',
          onPressed: () {
            if (registerCubit.formKey.currentState!
                .validate()) {
              registerCubit.userRegister();
            }
          },
        ),
      ),
    );
  }
}
