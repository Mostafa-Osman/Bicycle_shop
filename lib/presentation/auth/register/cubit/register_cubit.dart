import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/login_model/login_model.dart';
import 'package:udemy_flutter/data/repository/user_repo/register_repo.dart';
part 'register_states.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepo) : super(ShopRegisterInitialState());
  final formKey = GlobalKey<FormState>();
  final registerNameControl = TextEditingController();
  final registerEmailControl = TextEditingController();
  final registerPhoneControl = TextEditingController();
  final registerPasswordControl = TextEditingController();
  final registerConfirmPasswordControl = TextEditingController();
  late ShopLoginModel register;

  final RegisterRepository registerRepo ;

  Future<void> userRegister() async {
    emit(ShopRegisterLoadingState());
    try {
      register = await registerRepo.userRegister(
        name: registerNameControl.text,
        email: registerEmailControl.text,
        password: registerPasswordControl.text,
        phone: registerPhoneControl.text,
      );
      emit(ShopRegisterSuccessState(register));
    } catch (error,s) {
      log('user register',error: error,stackTrace: s);
      emit(ShopRegisterErrorState(error.toString()));
    }
  }

  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(RegisterRefreshUi());
  }

  // variable bool to change visibility in (confirm field)
  bool confirmNotVisible = true;

  // method to switch icon visibility (in confirm password field )
  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(RegisterRefreshUi());
  }
}
