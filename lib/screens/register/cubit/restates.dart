import 'package:udemy_flutter/screens/login/model/login_model.dart';

abstract class RegisterStates {}

class ShopRegisterInitialState extends RegisterStates {}

class ShopRegisterLoadingState extends RegisterStates {}

class ShopRegisterSuccessState extends RegisterStates {
  final ShopLoginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorState extends RegisterStates {
  final  error;

  ShopRegisterErrorState(this.error);
}

class ShopRegisterVisibilityPasswordState extends RegisterStates {}

class ConfirmRegisterVisibilityPasswordState extends RegisterStates {}
