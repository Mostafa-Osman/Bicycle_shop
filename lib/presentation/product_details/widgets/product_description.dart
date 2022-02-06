import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDescription extends StatelessWidget {
  final DetailsData productDetails;

  ProductDescription({required this.productDetails});
  @override
  Widget build(BuildContext context) {
    return  Container(
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
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CustomFavouriteIcon(
                    productId: productDetails.id!, iconSize: 40.0),
              ),
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
    );
  }
}
