import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/login/model/login_model.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';

class LoginRepo {
  // object from dio and cash helper
  // pass it to constructor
  // use get it lib for dependency injection

  //get user data
  Future<ShopLoginModel> userLogin(email, password) async {
    try {
      final response = await DioHelper.postData(
          url: LOGIN, data: {'email': email, 'password': password});
      if (response.data['status'] == true) {
        return ShopLoginModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
