import 'package:flutter/material.dart';

void navigateTo(BuildContext context,String route) => Navigator.pushNamed(
   context,
      route,
    );

void navigatorAndFinish (BuildContext context,String route) => Navigator.of(context)
    .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);

void navigateWithArgument(BuildContext context,String route,dynamic argument) =>
    Navigator.pushNamed(context, route, arguments: argument);

// void navigateReplacement(BuildContext context, page) => Navigator.pushReplacement(
//     context, MaterialPageRoute(builder: (BuildContext context) => page),);
