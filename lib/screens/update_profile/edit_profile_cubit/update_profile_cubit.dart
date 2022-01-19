import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? userData;
  final profileRepo = ProfileRepo();

  // update profile
  Future<void> updateUserData(
      {required name, required email, required phone}) async {
    emit(UpdateProfileLoading());
    try {
      userData = await profileRepo.updateUserData(
          name: name, email: email, phone: phone);
      emit(UpdateProfileSuccess(userData!));
    } catch (e) {
      emit(UpdateProfileError());
      rethrow;
    }
  }
}
