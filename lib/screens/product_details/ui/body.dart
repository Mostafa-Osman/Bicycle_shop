import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class Body extends StatelessWidget {
  final productDetails;
  final boardingController = PageController();

  Body({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //photo
        Container(
          height: 250.0,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            itemExtent: 400.0,
            itemCount: productDetails!.images.length,
            itemBuilder: (context, index) {
              HomeCubit.get(context).changePhotoIndex(index-1);
              return Image(
                image: NetworkImage(productDetails!.images[index]),
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        //small photo
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
          child: Container(
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: productDetails!.images.length,
              itemBuilder: (context, index) {
                return (index == HomeCubit.get(context).photoIndex)
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.green, width: 2)),
                        child: Image(
                          image: NetworkImage(productDetails!.images[index]),
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    : Image(
                        image: NetworkImage(productDetails!.images[index]),
                        fit: BoxFit.cover,
                      );
              },
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xFFFFF8DC),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //price and favourite
              Row(
                children: [
                  CustomText(
                      text: 'EGP ${productDetails.price}  ',
                      textColor: mainColor),
                  Spacer(),
                  CustomFavouriteIcon(
                      checkFavourite:
                          HomeCubit.get(context).favourites[productDetails.id],
                      onPressed: () => FavouriteCubit.get(context)
                          .changeFavorites(productDetails.id!, context),
                      iconSize: 40.0),
                ],
              ),
              //name
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 10.0, left: 10.0, bottom: 30.0),
                child: CustomText(
                    text: '${productDetails.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.bold),
              ),
              //description
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 10.0, left: 10.0, bottom: 50.0),
                child: ExpandableText(
                  '${productDetails.description}',
                  expandText: 'show more',
                  collapseText: 'show less',
                  //to make text(show more) bold
                  linkStyle: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 3,
                  linkColor: mainColor,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.3,
                  ),
                ),
              ),
              //rate
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: amber,
                ),
                onRatingUpdate: (rating) => null,
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ],
    );
  }
}
