import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/screens/product_details/widgets/product_details_photos.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
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
        ProductDetailsPhotos(productDetails:productDetails),
        ProductDescription(productDetails:productDetails),
      ],
    );
  }
}
