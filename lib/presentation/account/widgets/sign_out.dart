import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/auth/logout/logout_bloc.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogOutState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          showToast(message: 'logout success', state: ToastStates.success);
          navigatorAndFinish(context, RouteConstant.loginRoute);
        } else if (state is LogoutErrorState) {
          showToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<LogoutCubit>(context).userLogout();
          },
          child: CustomCard(
            height: 65.0,
            width: double.infinity,
            widget: Column(
              children: const [
                ListTile(
                  title: CustomText(
                    text: 'Sign out',
                    textColor: red,
                    fontSize: 15.0,
                  ),
                  trailing: Icon(
                    Icons.logout,
                    color: red,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
