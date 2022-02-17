import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';

class Body extends StatelessWidget {
  final productDetails;
  final boardingController = PageController();

  Body({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsPhotos(productDetails: productDetails),
          SizedBox(height: 20.0),
          Expanded(child: ProductDescription(productDetails: productDetails)),
        ],
      ),
    );
  }
}
