import 'package:udemy_flutter/data/local/cache_helper.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';


void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) navigatorAndFinish(context, RouteConstant.loginRoute);
  });
}
var token;
var onBoarding;
ProfileModel? userData;