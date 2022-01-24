import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomFavouriteIcon extends StatelessWidget {
  final iconSize;
  final productId;

  CustomFavouriteIcon(
      {this.iconSize = 25.0, required this.productId});

  Widget build(BuildContext context) {
    return LikeButton(
      circleColor: CircleColor(start: Colors.redAccent, end: Colors.orange),
      animationDuration: Duration(seconds: 1),
      onTap: (bool isLiked) {
        return onLikeButtonTap(isLiked, context);
      },
      likeBuilder: (_) => Icon(
        Icons.favorite,
        size: iconSize,
        color: HomeCubit.get(context).favourites[productId] ? red : grey,
      ),
    );
  }

  Future<bool> onLikeButtonTap(bool isLiked, context) async {
    HomeCubit.get(context).favourites[productId] =
        !HomeCubit.get(context).favourites[productId];
    FavouriteCubit.get(context).changeFavorites(productId, context);
    return !isLiked;
  }
}
