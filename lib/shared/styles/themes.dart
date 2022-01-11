import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Color(0xff333739),
  appBarTheme: AppBarTheme(
    color: white,
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff333739),
      statusBarBrightness: Brightness.light,
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: white,
  backgroundColor: white,
  appBarTheme: AppBarTheme(
    color: white,
    titleSpacing: 100.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: black,
    statusBarBrightness: Brightness.dark,
    ),

  ),
);
