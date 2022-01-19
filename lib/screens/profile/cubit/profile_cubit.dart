import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  final profileRepo = ProfileRepo();
  ProfileModel? userData;

  Future<void> getUserData() async {
    emit(ProfileLoading());
    try {
      userData = await profileRepo.getUserData();
      emit(ProfileSuccess(userData!));
    } catch (e, s) {
      print(s.toString());
      emit(ProfileError());
    }
  }
}



