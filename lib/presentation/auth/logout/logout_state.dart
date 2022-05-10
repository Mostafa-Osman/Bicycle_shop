part of 'logout_bloc.dart';

@immutable
abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogoutLoadingState extends LogOutState {}

class LogoutSuccessState extends LogOutState {}

class LogoutRefreshUi extends LogOutState {}

class LogoutErrorState extends LogOutState {
  final String message;

  LogoutErrorState(this.message);
}
