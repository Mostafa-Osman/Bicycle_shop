import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/shared/components/build_item.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favouriteCubit = BlocProvider.of<FavouriteCubit>(context);
    //todo change to block builder and handle states
    return BlocConsumer<FavouriteCubit, FavouriteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is GetFavoritesSuccess,
          builder: (context) => Center(
            child: ConditionalBuilder(
              condition: favouriteCubit.favouritesModel.data.isEmpty,
              builder: (context) => EmptyScreen(),
              fallback: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => BuildItem(
                    model: favouriteCubit.favouritesModel.data[index].product,
                  ),
                  itemCount: favouriteCubit.favouritesModel.data.length,
                ),
              ),
            ),
          ),
          fallback: (context) => const CustomLoading(),
        );
      },
    );
  }
}
