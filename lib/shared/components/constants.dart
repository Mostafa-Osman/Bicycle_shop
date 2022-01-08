import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/login/ui/login.dart';
import 'package:udemy_flutter/shared/network/locial/cache_helper.dart';

import 'component.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) navigatorAndFinish(context, RouteConstant.loginRoute);
  });
}
//to print all text
void printFullText(String text) {
  final pattern = RegExp(".{1,800}");
  pattern.allMatches(text).forEach((element) {
    print(element.group(0));
  });
}
var token;