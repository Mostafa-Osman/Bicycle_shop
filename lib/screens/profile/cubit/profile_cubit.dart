import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? userModel;

  void getUserData() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = ProfileModel.fromJson(value.data);
      emit(ProfileSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState());
    });
  }

// update profile
  void updateUserData({required name, required email, required phone}) {
    emit(UpdateProfileLoadingState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
        data: {'name': name, 'email': email, 'phone': phone}).then((value) {
      userModel = ProfileModel.fromJson(value.data);
      emit(UpdateProfileSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopUpdateProfileErrorState());
    });
  }
}