import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/login_model/login_model.dart';

class LoginRepository {
  Future<ShopLoginModel> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.postData(
      url: loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    );

    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return ShopLoginModel.fromJson(data);
    }
    throw 'Email or password invalid';
  }
}
