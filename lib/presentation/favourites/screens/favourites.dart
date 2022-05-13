import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/build_item.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favouriteCubit = BlocProvider.of<FavouriteCubit>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait(
          [BlocProvider.of<FavouriteCubit>(context).getFavouritesData()],
        );
      },
      child: BlocBuilder<FavouriteCubit, FavouriteStates>(
        builder: (context, state) {
          if (state is GetFavoritesLoading) {
            return const Center(child: CustomLoading());
          } else {
            if (state is GetFavoritesError) {
              return NetworkDisconnected(
                onPress: () {
                  BlocProvider.of<FavouriteCubit>(context).getFavouritesData();
                },
              );
            } else {
              if (favouriteCubit.favouritesModel.data.isEmpty) {
                return SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: EmptyScreen(
                      onPress: () {
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .changeCurrentIndex(2);
                        navigatorAndFinish(
                          context,
                          RouteConstant.shopLayoutRoute,
                        );
                      },
                    ),
                  ),
                );
              } else {
                return ListView.separated(
                  padding: const EdgeInsets.all(10.0).copyWith(bottom: 70.0),
                  itemBuilder: (context, index) => BuildItem(
                    model: favouriteCubit.favouritesModel.data[index].product,
                    itemId:
                        favouriteCubit.favouritesModel.data[index].product.id,
                    isFavouriteScreen: true,
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
      ),
    );
  }
}
