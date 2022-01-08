
import 'package:udemy_flutter/screens/login/model/login_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates {
  final ShopLoginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorState extends ShopRegisterStates {
  final String error;

  ShopRegisterErrorState(this.error);
}

class ShopRegisterVisibilityPasswordState extends ShopRegisterStates {}
