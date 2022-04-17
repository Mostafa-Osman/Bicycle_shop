import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/profile_model/profile_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class ProfileRepository {


  //get user data
  Future<ProfileModel> getUserData() async {
      final response = await DioHelper.getData(url: profileUrl, token: token);


      final data = response.data as Map<String, dynamic>;
      if (data['status'] == true) {
        return ProfileModel.fromJson(data);
      }
      throw 'server error';


  }

  // update user data
  Future<ProfileModel> updateUserData({
    String?  name,
    String?  email,
    String?  phone,
    String?  image,
    String?  password,
  }) async {

      final response =
          await DioHelper.putData(url: updateProfileUrl, token: token, data: {
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'password': password,
      },);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == true) {
        return ProfileModel.fromJson(data);
      }
      throw 'server error';
  }
}
