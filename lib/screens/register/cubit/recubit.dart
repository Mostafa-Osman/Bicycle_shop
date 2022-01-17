import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/login/model/login_model.dart';
import 'package:udemy_flutter/screens/register/cubit/restates.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(ShopRegisterInitialState());

  ShopLoginModel? loginModel;

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      print(value.data);

      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error) {
      emit(ShopRegisterErrorState(error));
    });
  }

  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(ShopRegisterVisibilityPasswordState());
  }

  // variable bool to change visibility in (confirm field)
  bool confirmNotVisible = true;
  // method to switch icon visibility (in confirm password field )
  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(ConfirmRegisterVisibilityPasswordState());
  }
}
