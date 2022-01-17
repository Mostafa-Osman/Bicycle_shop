import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  ProfileModel? userData;

  // update profile
  void updateUserData(
      {required name, required email, required phone, required image}) {
    emit(UpdateProfileLoading());
    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image
    }).then((value) {
      userData = ProfileModel.fromJson(value.data);
      emit(UpdateProfileSuccess(userData!));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileError());
    });
  }
}
