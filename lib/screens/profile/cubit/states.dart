
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final ProfileModel userModel;

  ProfileSuccessState(this.userModel);
}

class ProfileErrorState extends ProfileStates {}

class UpdateProfileLoadingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {
  final ProfileModel userModel;

  UpdateProfileSuccessState(this.userModel);
}

class ShopUpdateProfileErrorState extends ProfileStates {}