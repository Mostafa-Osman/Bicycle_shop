import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/register_repo.dart';
import 'package:udemy_flutter/screens/login/model/login_model.dart';
import 'package:udemy_flutter/screens/register/cubit/restates.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(ShopRegisterInitialState());

  ShopLoginModel? register;

  static RegisterCubit get(context) => BlocProvider.of(context);
  final registerRepo = RegisterRepo();

  Future<void> userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(ShopRegisterLoadingState());
    try {
      register = await registerRepo.userRegister(
          name: name, email: email, password: password, phone: phone);
      emit(ShopRegisterSuccessState(register!));
    } catch (error) {
      log(error.toString());
      emit(ShopRegisterErrorState(error));
    }
  }

  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(ShopRegisterVisibilityPasswordState());
  }

  // variable bool to change visibility in (confirm field)
  bool confirmNotVisible = true;

  // method to switch icon visibility (in confirm password field )
  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(ConfirmRegisterVisibilityPasswordState());
  }
}
