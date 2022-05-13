import 'dart:developer';

import 'package:udemy_flutter/data/data_sources/local/pref/pref_setup.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class UserPrefs {
  final prefs = SharedPrefs.instance;

  // Future<void> saveUserData(Map<String, dynamic>? userData) async {
  //   await prefs.setString("userData", jsonEncode(userData));
  // }

  // Future<ProfileModel> getUserProfile() async {
  //   log(prefs.getString("userData")!);
  //   final user =
  //       await jsonDecode(prefs.getString("userData")!) as Map<String, dynamic>;
  //   return ProfileModel.fromJson(user);
  // }

  Future<void> setUserToken(String token) => prefs.setString(userToken, token);

  String getUserToken() => prefs.getString(userToken) ?? 'error token';

  Future<void> deleteUserToken() async => prefs.remove(userToken);

  // Future<void> saveAccountChanges({
  //   required String name,
  //   required String birthdate,
  // }) async {
  //   final userData =
  //       await jsonDecode(prefs.getString("userData")!) as Map<String, dynamic>;
  //   userData['fullName'] = name;
  //   userData['birthDate'] = birthdate;
  //   await saveUserData(userData);
  // }

  bool isUserLoggedIn() {
    final token = prefs.getString("token");
    log(token.toString());
    return token != null;
  }
}
