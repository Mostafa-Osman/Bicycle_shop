
import 'package:udemy_flutter/screens/login/model/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final ShopLoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final error;

  LoginErrorState(this.error);
}

class LoginVisibilityPasswordState extends LoginStates {}

