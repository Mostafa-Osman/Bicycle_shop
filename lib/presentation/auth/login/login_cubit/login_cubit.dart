import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/login_model/login_model.dart';
import 'package:udemy_flutter/data/repository/user_repo/login_repo.dart';

part 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  late ShopLoginModel loginModel;

  final LoginRepository loginRepo;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      loginModel = await loginRepo.userLogin(email: email, password: password);
      emit(LoginSuccessState(loginModel));
    } catch (e,s) {
      log('login error',error: e,stackTrace: s);
      emit(LoginErrorState(e.toString()));
    }
  }

  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(LoginVisibilityPasswordState());
  }
}
