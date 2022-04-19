import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/shared/components/custom_favourite_icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDescription extends StatelessWidget {
  final DetailsData productDetails;

  const ProductDescription({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding:const EdgeInsets.all(10),
      decoration:const BoxDecoration(
          color: Color(0xFFFFF8DC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30),),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //price and favourite
          Row(
            children: [
              CustomText(
                  text: 'EGP ${productDetails.price}  ', textColor: mainColor,),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CustomFavouriteIcon(

                    productId: productDetails.id, iconSize: 40.0,),
              ),
            ],
          ),
          //name
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, right: 10.0, left: 10.0, bottom: 30.0,),
            child: CustomText(
                text: productDetails.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
                height: 1.3,
                fontWeight: FontWeight.bold,),
          ),
          //description
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ExpandableText(
                      productDetails.description,
                      expandText: 'show more',
                      collapseText: 'show less',
                      linkStyle: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 4,
                      linkColor: mainColor,
                      style:const TextStyle(
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const   SizedBox(height: 80.0),
                  //rate
                  RatingBar.builder(
                    minRating: 1,
                    allowHalfRating: true,
                    itemPadding:const EdgeInsets.symmetric(horizontal: 0.1),
                    itemBuilder: (context, _) =>const Icon(
                      Icons.star,
                      color: amber,
                    ),
                    onRatingUpdate: (rating) => 0,
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
