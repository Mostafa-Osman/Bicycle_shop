import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/login/model/login_model.dart';

class RegisterRepo {
  Future<ShopLoginModel> userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      final response = await DioHelper.postData(url: REGISTER, data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone
      });
      if (response.data['status'] == true) {
        return ShopLoginModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
