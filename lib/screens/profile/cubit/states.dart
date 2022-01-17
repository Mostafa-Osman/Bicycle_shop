import 'package:udemy_flutter/screens/profile/model/profile_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileSuccess extends ProfileStates {
  final ProfileModel userModel;

  ProfileSuccess(this.userModel);
}

class ProfileError extends ProfileStates {}
