// import 'package:shared_preferences/shared_preferences.dart';
//
// // ignore: avoid_classes_with_only_static_members
// class CacheHelper {
//   // object from SharedPreferences
//   static late SharedPreferences pref;
//
//   //initialize object from SharedPreferences (pref)
//   static Future<void> init() async {
//     pref = await SharedPreferences.getInstance();
//   }
//
//   //get all data from SharedPreferences
//   static dynamic getData({required String key}) => pref.get(key);
//   static String getUserToken(){
//     return pref.getString('token')?? '';
//   }
//
//   //set and save data  object SharedPreferences (pref)
//   static Future<bool> saveData({
//     required String key,
//     required dynamic value,
//   }) async {
//     if (value is String) return pref.setString(key, value);
//     if (value is int) return pref.setInt(key, value);
//     if (value is bool) return pref.setBool(key, value);
//
//     return pref.setDouble(key, value as double);
//   }
//
//   //remove data form object SharedPreferences (pref)
//   static Future<bool> removeData({required String key}) async {
//     return pref.remove(key);
//   }
// }
