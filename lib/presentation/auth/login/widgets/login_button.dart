import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:udemy_flutter/presentation/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/toast.dart';

class SubmitLogin extends StatelessWidget {
  const SubmitLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status) {
            navigatorAndFinish(context, RouteConstant.shopLayoutRoute);
          }
        } else if (state is LoginErrorState) {
          showToast(state: ToastStates.error, message: state.error);
        }
      },
      builder: (context, state) => ConditionalBuilder(
        condition: state is! LoginLoadingState,
        builder: (context) => CustomButton(
          text: 'Login',
          onPressed: () {
            BlocProvider.of<BottomNavBarCubit>(context)
                .changeCurrentIndex(2);
            if (loginCubit.formKey.currentState!.validate()) {
              loginCubit.userLogin();
            }
          },
        ),
        fallback: (context) => const Center(child: CustomLoading()),
      ),
    );
  }
}
