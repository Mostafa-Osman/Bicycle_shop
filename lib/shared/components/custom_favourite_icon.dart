import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomFavouriteIcon extends StatelessWidget {
  final double iconSize;
  final bool? isFavouriteScreen;
  final int productId;

  const CustomFavouriteIcon({
    this.iconSize = 25.0,
    required this.productId,
    this.isFavouriteScreen,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return LikeButton(
      circleColor: const CircleColor(
        start: Colors.redAccent,
        end: Colors.orange,
      ),
      onTap: (bool isLiked) {
        return onLikeButtonTap(
          isLiked: isLiked,
          context: context,
          productId: productId,
        );
      },
      likeBuilder: (_) => Icon(
        Icons.favorite,
        size: iconSize,
        color: isFavouriteScreen != null
            ? red
            : homeCubit.favourites[productId]!
                ? red
                : grey,
      ),
    );
  }

  Future<bool> onLikeButtonTap({
    required bool isLiked,
    required BuildContext context,
    required int productId,
  }) async {
    BlocProvider.of<HomeCubit>(context).changeHomeFavourites(productId);

    BlocProvider.of<FavouriteCubit>(context).changeFavourites(productId);
    return !isLiked;
  }
}
