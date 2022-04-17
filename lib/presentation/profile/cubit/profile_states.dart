
part of'profile_cubit.dart';
abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileSuccess extends ProfileStates {
}

class ProfileError extends ProfileStates {
  final String message;

  ProfileError(this.message);
}
