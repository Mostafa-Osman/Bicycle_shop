

import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';

class Body extends StatelessWidget {
  final productDetails;
  final boardingController = PageController();

  Body({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsPhotos(productDetails:productDetails),
        ProductDescription(productDetails:productDetails),
      ],
    );
  }
}
