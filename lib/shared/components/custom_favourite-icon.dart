import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomFavouriteIcon extends StatelessWidget {
  final onPressed;
  final checkFavourite;
  final iconSize;

  CustomFavouriteIcon(
      {required this.onPressed,
      required this.checkFavourite,
      this.iconSize = 25.0});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: checkFavourite
          ? Icon(
              Icons.favorite,
              size: iconSize,
              color: red,
            )
          : Icon(
              Icons.favorite_border,
              size: iconSize,
            ),
    );
  }
}
