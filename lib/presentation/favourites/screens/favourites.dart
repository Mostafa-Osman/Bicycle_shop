import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/build_item.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favouriteCubit = BlocProvider.of<FavouriteCubit>(context);
    return BlocBuilder<FavouriteCubit, FavouriteStates>(
      builder: (context, state) {
        if (state is GetFavoritesLoading) {
          return const Center(child: CustomLoading());
        } else {
          if (state is GetFavoritesError) {
            return const Center(
              child: Text(
                'Error',
                style: TextStyle(fontSize: 30, color: red),
              ),
            );
          } else {
            if (favouriteCubit.favouritesModel.data.isEmpty) {
              return EmptyScreen(
                onPress: () {
                  BlocProvider.of<LayoutCubit>(context).changeCurrentIndex(2);
                  navigatorAndFinish(
                    context,
                    RouteConstant.shopLayoutRoute,
                  );
                },
              );
            } else {
              return  ListView.separated(
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) => BuildItem(
                  model: favouriteCubit
                      .favouritesModel.data[index].product,
                  itemId: favouriteCubit
                      .favouritesModel.data[index].product.id,
                ),
                itemCount: favouriteCubit.favouritesModel.data.length,
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 5.0,
                ),
              );
            }
          }
        }
      },
    );
  }
}
