import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class ProfileRepo {
  // object from dio and cash helper
  // pass it to constructor
  // use get it lib for dependency injection

  //get user data
  Future<ProfileModel> getUserData() async {
    try {
      final response = await DioHelper.getData(url: PROFILE, token: token);
      if (response.data['status'] == true) {
        return ProfileModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }

  // update user data
  Future<ProfileModel> updateUserData(
      {required name,
      required email,
      required phone,
      required image,
      //required password
      }) async {
    try {
      final response =
          await DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        //'password': password
      });
      if (response.data['status'] == true) {
        return ProfileModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e) {
      rethrow;
    }
  }
}
