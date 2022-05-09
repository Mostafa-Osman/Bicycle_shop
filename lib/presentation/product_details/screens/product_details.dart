import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_button.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // basketCubit.productDetailsQuantity(resetQuantity: true);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, RouteConstant.basketRoute);
              // basketCubit.productDetailsQuantity(resetQuantity: true);
            },
            icon: SvgPicture.asset(
              'assets/icons/basket.svg',
              fit: BoxFit.fitWidth,
              color: mainColor,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CustomLoading());
          } else if (state is ProductDetailsError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailsPhotos(),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: ProductDescription(),
                      ),
                    ],
                  ),

                  ProductDetailsButton(
                    productId: productDetailsCubit.productDetailsModel.data.id,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
