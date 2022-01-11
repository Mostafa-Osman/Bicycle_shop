import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/states.dart';
import 'package:udemy_flutter/shared/components/build_item.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: CustomText(text: 'Favourites', textColor: mainColor),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_sharp, color: orange),
              ),
            ),
            body: ConditionalBuilder(
              condition: (state is GetFavoritesLoadingState),
              builder: (context) => Center(
                  child: CircularProgressIndicator(
                color: red,
              )),
              fallback: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemBuilder: (context, index) => BuildItem(
                        model: FavouriteCubit.get(context)
                            .favouritesModel!
                            .data!
                            .data[index]
                            .product),
                    itemCount: FavouriteCubit.get(context)
                        .favouritesModel!
                        .data!
                        .data
                        .length),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}


