import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // object from SharedPreferences
  static late SharedPreferences pref;

  //initialize object from SharedPreferences (pref)
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  //get all data from SharedPreferences
  static dynamic getData({required String key}) => pref.get(key);

  //set and save data  object SharedPreferences (pref)
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await pref.setString(key, value);
    if (value is int) return await pref.setInt(key, value);
    if (value is bool) return await pref.setBool(key, value);

    return await pref.setDouble(key, value);
  }

  //remove data form object SharedPreferences (pref)
  static Future<bool> removeData({required String key}) async {
    return await pref.remove(key);
  }
}
