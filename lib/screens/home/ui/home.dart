import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/Custom_favourite-icon.dart';

import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import '../home_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state is! HomeSuccessState)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: red,
                ))
              : productsBuilder(HomeCubit.get(context).homeModel, context);
        });
  }

  Widget productsBuilder(model, context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: TextFormField(
                readOnly: true,
                onTap: () => navigateTo(context, RouteConstant.searchRoute),
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),

            //banner
            //  CarouselSlider(
            //    items: model.banner.data
            //        .map((e) => Padding(
            //              padding: const EdgeInsets.all(10.0),
            //              child: Container(
            //                decoration: BoxDecoration(
            //                    borderRadius: BorderRadius.circular(20)),
            //                clipBehavior: Clip.antiAliasWithSaveLayer,
            //                child: Image(
            //                  image: NetworkImage(e.image),
            //                  width: double.infinity,
            //                  fit: BoxFit.cover,
            //                ),
            //              ),
            //            ))
            //        .toList(),
            //    options: CarouselOptions(
            //        height: 200.0,
            //        initialPage: 1,
            //        enableInfiniteScroll: true,
            //        reverse: false,
            //        autoPlay: false,
            //        autoPlayInterval: Duration(seconds: 3),
            //        autoPlayAnimationDuration: Duration(seconds: 3),
            //        autoPlayCurve: Curves.fastOutSlowIn,
            //        viewportFraction: 1.0,
            //        scrollDirection: Axis.horizontal),
            //  ),

            SizedBox(
              height: 20,
            ),
            StaggeredGridView.countBuilder(
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              //direction of scrolling
              scrollDirection: Axis.vertical,
              //to make products in home page scrolling
              physics: ScrollPhysics(),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: model.data!.detailsData.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildGridProduct(model.data!.detailsData[index], context),
            ),
          ],
        ),
      );

  Widget buildGridProduct(model, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => navigateWithArgument(
            context, RouteConstant.productDetailsRoute, model),
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: NetworkImage(model.image),
                    ),
                  ),
                  if (model.discount != 0)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/icons/discount.png",
                      ),
                      width: 50,
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.3),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EGP ${model.price}',
                              maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor),
                            ),
                            if (model.discount != 0)
                              Text(
                                ' ${model.oldPrice} EGP',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13,
                                    height: 1.3,
                                    color: grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                          ],
                        ),
                        Spacer(),
                        CustomFavouriteIcon(
                            onPressed: () => FavouriteCubit.get(context)
                                .changeFavorites(model.id!, context),
                            checkFavourite:
                                HomeCubit.get(context).favourites[model.id]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
