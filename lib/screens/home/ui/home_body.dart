import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBody extends StatelessWidget {
  final model;

  const HomeBody({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 10.0),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
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
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () =>
                      navigateTo(context, RouteConstant.favouriteRoute),
                  icon: Icon(Icons.favorite, color: red, size: 40),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //banner
                CarouselSlider(
                  items: HomeCubit.get(context)
                      .banner!
                      .data
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image(
                                image: NetworkImage('${e.image}'),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      height: 200.0,
                      initialPage: 1,
                      autoPlay: false,
                      enableInfiniteScroll: true,
                      reverse: false,
                      // autoPlayInterval: Duration(seconds: 10),
                      // autoPlayAnimationDuration: Duration(seconds: 4),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1.0,
                      scrollDirection: Axis.horizontal),
                ),

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
                      Item(data: model.data!.detailsData[index]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final data;

  const Item({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => navigateWithArgument(
            context, RouteConstant.productDetailsRoute, data),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: 200.0,
                    child: Image(
                      image: NetworkImage(data.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  if (data.discount != 0)
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
                    CustomText(
                      text: data.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      height: 1.3,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'EGP ${data.price}',
                                maxLines: 2,
                                // overflow: TextOverflow.ellipsis,

                                fontSize: 14,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                textColor: mainColor),
                            if (data.discount != 0)
                              CustomText(
                                  text: ' ${data.oldPrice} EGP',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  height: 1.3,
                                  textColor: grey,
                                  decoration: TextDecoration.lineThrough),
                          ],
                        ),
                        Spacer(),
                        CustomFavouriteIcon(
                            onPressed: () => FavouriteCubit.get(context)
                                .changeFavorites(data.id!, context),
                            checkFavourite:
                                HomeCubit.get(context).favourites[data.id]),
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
