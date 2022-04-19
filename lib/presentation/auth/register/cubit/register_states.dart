
part of 'register_cubit.dart';
abstract class RegisterStates {}

class ShopRegisterInitialState extends RegisterStates {}

class ShopRegisterLoadingState extends RegisterStates {}

class ShopRegisterSuccessState extends RegisterStates {
  final ShopLoginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorState extends RegisterStates {
  final  String error;

  ShopRegisterErrorState(this.error);
}

class RegisterRefreshUi extends RegisterStates {}
