import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_button.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsScreen extends StatelessWidget {
  final DetailsData productDetails;

  const ProductDetailsScreen({
    required this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        actions: [
          IconButton(
            onPressed: () => navigateTo(context, RouteConstant.basketRoute),
            icon: SvgPicture.asset(
              'assets/icons/basket.svg',
              fit: BoxFit.fitWidth,
              color: mainColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsPhotos(productDetails: productDetails),
                const SizedBox(height: 20.0),
                Expanded(
                  child: ProductDescription(productDetails: productDetails),
                ),
              ],
            ),
            ProductDetailsButton(
              productId: productDetails.id,
            ),
          ],
        ),
      ),
    );
  }
}
