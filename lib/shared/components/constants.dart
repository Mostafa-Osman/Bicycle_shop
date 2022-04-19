import 'package:udemy_flutter/data/data_sources/local/cache_helper.dart';
import 'package:udemy_flutter/data/models/profile_model/profile_model.dart';

void signOut() {
  CacheHelper.removeData(key: 'token');
}

String? token;
dynamic onBoarding;
late ProfileModel userData;
