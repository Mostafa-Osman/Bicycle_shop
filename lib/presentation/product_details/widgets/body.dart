import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class ProductDetailsBody extends StatelessWidget {
  final DetailsData productDetails;
  final boardingController = PageController();

  ProductDetailsBody({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);

    return SizedBox(
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
          Positioned(
            bottom: 8.0,
            right: 8.0,
            left: 0.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // const ChangeQuantityProduct(
                  //   index: 0,
                  // ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      text: 'Add to basket',
                      onPressed: () {
                        basketCubit.addToBasketOrders(productDetails.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
