import 'package:flutter/widgets.dart';
import 'package:udemy_flutter/data/data_sources/local/cache_helper.dart';
import 'package:udemy_flutter/data/models/profile_model/profile_model.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

void signOut(BuildContext context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) navigatorAndFinish(context, RouteConstant.loginRoute);
  });
}

 String? token;
dynamic onBoarding;
late ProfileModel userData;
