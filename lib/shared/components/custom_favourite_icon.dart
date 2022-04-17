import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CustomFavouriteIcon extends StatelessWidget {
  final double iconSize;
  final int productId;

  const CustomFavouriteIcon({this.iconSize = 25.0, required this.productId});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return (homeCubit.favourites.isNotEmpty)
            ? LikeButton(
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
                  color: homeCubit.favourites[productId]! ? red : grey,
                ),
              )
            : const CustomLoading(size: 20.0);
      },
    );
  }

  Future<bool> onLikeButtonTap({
    required bool isLiked,
    required BuildContext context,
    required int productId,
  }) async {
    BlocProvider.of<HomeCubit>(context).favourites[productId] =
        !BlocProvider.of<HomeCubit>(context).favourites[productId]!;
    BlocProvider.of<FavouriteCubit>(context).changeFavorites(productId);
    return !isLiked;
  }
}
