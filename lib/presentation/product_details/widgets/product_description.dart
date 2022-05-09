import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_favourite_icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFC4C4C4).withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //price and favourite
          Row(
            children: [
              CustomText(
                text:
                    'EGP ${productDetailsCubit.productDetailsModel.data.price}  ',
                textColor: mainColor,
              ),
              if (productDetailsCubit.productDetailsModel.data.discount != 0)
                CustomText(
                  text:
                      'EGP ${productDetailsCubit.productDetailsModel.data.oldPrice}  ',
                  textColor: grey,
                  fontSize: 14.0,
                  decoration: TextDecoration.lineThrough,
                ),
              const Spacer(),
              CustomFavouriteIcon(
                productId: productDetailsCubit.productDetailsModel.data.id,
                iconSize: 40.0,
              ),
              const SizedBox(width: 10.0),
            ],
          ),
          const SizedBox(height: 5.0),
          //name
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              right: 10.0,
              left: 10.0,
              bottom: 30.0,
            ),
            child: CustomText(
              text: productDetailsCubit.productDetailsModel.data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
              height: 1.3,
              fontWeight: FontWeight.w500,
            ),
          ),
          //description
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandableText(
                      productDetailsCubit.productDetailsModel.data.description,
                      expandText: 'show more',
                      collapseText: 'show less',
                      linkStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoSerif',
                      ),
                      maxLines: 7,
                      linkColor: mainColor,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.3,
                        fontFamily: 'RobotoSerif',
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    //rate
                    RatingBar.builder(
                      minRating: 1,
                      allowHalfRating: true,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.1),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: amber,
                      ),
                      onRatingUpdate: (rating) => 0,
                    ),
                    const SizedBox(height: 80.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
