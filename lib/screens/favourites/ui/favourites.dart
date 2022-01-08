import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/states.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/Custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteStates>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: (state is GetFavoritesLoadingState),
            builder: (context) => Center(
                child: CircularProgressIndicator(
              color: red,
            )),
            fallback: (context) => ListView.builder(
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
          );
        },
        listener: (context, state) {});
  }
}

class BuildItem extends StatelessWidget {
  final model;

  const BuildItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10),
      child: CustomCard(
        widget: SizedBox(
          height: 130,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(width: 7.0),
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: 120,
                    height: 120,
                  ),
                  if (model.discount != 0)
                    Image.asset(
                      "assets/icons/discount.png",
                    ),
                ],
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'EGP ${model.price.toString()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                color: mainColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          if (model.discount != 0)
                            Text(
                              'EGP ${model.oldPrice.toString()}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13,
                                  height: 1.3,
                                  color: grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          Spacer(),
                          CustomFavouriteIcon(
                              checkFavourite:
                                  HomeCubit.get(context).favourites[model.id],
                              onPressed: () => FavouriteCubit.get(context)
                                  .changeFavorites(model.id!, context))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
