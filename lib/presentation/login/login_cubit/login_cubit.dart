import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/login_repo.dart';
import 'package:udemy_flutter/presentation/login/login_cubit/states.dart';
import 'package:udemy_flutter/data/models/login_model/login_model.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  // var loginModel;
  ShopLoginModel? loginModel;

  final loginRepo = LoginRepo();

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      loginModel = await loginRepo.userLogin(email, password);
      emit(LoginSuccessState(loginModel!));
    } catch (e) {
      emit(LoginErrorState(e));
    }
  }

  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(LoginVisibilityPasswordState());
  }
}
