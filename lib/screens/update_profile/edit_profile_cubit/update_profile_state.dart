part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final ProfileModel userModel;

  UpdateProfileSuccess(this.userModel);
}

class UpdateProfileError extends UpdateProfileState {}
