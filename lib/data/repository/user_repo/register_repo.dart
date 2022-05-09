import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/login_model/login_model.dart';

class RegisterRepository {
  Future<ShopLoginModel> userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final response = await DioHelper.postData(
      url: registerUrl,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );

    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return ShopLoginModel.fromJson(data);
    }
    throw data['message'] as String;
  }
}
