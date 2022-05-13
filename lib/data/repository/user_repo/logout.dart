import 'package:udemy_flutter/data/data_sources/local/pref/user_pref.dart';
import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
class LogoutRepository {
  final UserPrefs userPrefs;
  const LogoutRepository(this.userPrefs);
  Future<bool> userLogout() async {
    final response = await DioHelper.postData(
      url: logoutUrl,
      token: userPrefs.getUserToken(),
    );
    final data = response.data as Map<String, dynamic>;

    if (data['status'] == true) {
      return true;
    }
    throw 'Error logout';
  }
}
