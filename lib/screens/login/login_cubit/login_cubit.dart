import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/login/model/login_model.dart';
import 'package:udemy_flutter/screens/login/login_cubit/states.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;

  // var loginModel;

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error));
      // emit(ShopLoginSuccessState(loginModel!));
    });
  }



  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(LoginVisibilityPasswordState());
  }
}