import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:udemy_flutter/data/data_sources/local/cache_helper.dart';
import 'package:udemy_flutter/data/repository/user_repo/logout.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogOutState> {
  LogoutCubit(this.logoutRepo) : super(LogOutInitial());

  final LogoutRepository logoutRepo;

  Future<void> userLogout() async {
    emit(LogoutLoadingState());
    try {
      await logoutRepo.userLogout();
      signOut();
      emit(LogoutSuccessState());
    } catch (e, s) {
      log('logout error', error: e, stackTrace: s);
      emit(LogoutErrorState(e.toString()));
    }
  }

  void signOut() {
    CacheHelper.removeData(key: 'token');
    token = '';
    emit(LogoutRefreshUi());
  }
}
