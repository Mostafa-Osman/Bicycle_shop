import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomLoading extends StatelessWidget {
  final size;

  const CustomLoading({ this.size=70.0}) ;
  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: mainColor,
      size: size,
    );
  }
}
