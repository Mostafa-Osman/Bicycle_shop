import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness: Brightness.light,
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    titleSpacing: 100.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    statusBarBrightness: Brightness.dark,
    ),

  ),
);
