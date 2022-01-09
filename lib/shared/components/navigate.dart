import 'package:flutter/material.dart';

void navigateTo(context, route) => Navigator.pushNamed(
  context,
  route,
);

void navigatorAndFinish(context, route) => Navigator.of(context)
    .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);

void navigateWithArgument(context, route, argument) =>
    Navigator.pushNamed(context, route, arguments: argument);