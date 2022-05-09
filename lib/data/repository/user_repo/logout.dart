import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
class LogoutRepository {
  Future<bool> userLogout() async {
    final response = await DioHelper.postData(
      url: logoutUrl,
      token: token,
    );
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return true;
    }
    throw 'Error logout';
  }
}
