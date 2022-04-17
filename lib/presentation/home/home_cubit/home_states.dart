part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoading extends HomeStates {}
class HomeSuccess extends HomeStates {}

class HomeRefreshUi extends HomeStates {}

class HomeError extends HomeStates {
  final String message;

  HomeError(this.message);
}

class BannerLoading extends HomeStates {}

class BannerSuccess extends HomeStates {}

class BannerError extends HomeStates {
  final String message;

  BannerError(this.message);
}
