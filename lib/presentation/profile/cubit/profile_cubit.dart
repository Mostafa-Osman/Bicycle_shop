import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  final ProfileRepository profileRepo;

  Future<void> getUserData() async {
    emit(ProfileLoading());
    try {
      userData = await profileRepo.getUserData();
      emit(ProfileSuccess());
    } catch (error, s) {
      log('get user data', error: error, stackTrace: s);
      emit(ProfileError(error.toString()));
    }
  }
}
