import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';


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