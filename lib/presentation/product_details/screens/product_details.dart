import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/app_bar.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_button.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(child: CustomLoading());
            } else if (state is ProductDetailsError) {
              return NetworkDisconnected(
                onPress: () {
                  BlocProvider.of<ProductDetailsCubit>(context)
                      .getProductDetailsData(productId: productId);
                },
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    const ProductDetailsAppBar(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 80.0),
                        ProductDetailsPhotos(),
                        //todo may be remove it after check apk
                        const SizedBox(height: 10.0),
                        Expanded(
                          child: ProductDescription(),
                        ),
                      ],
                    ),
                    ProductDetailsButton(
                      productId:
                          productDetailsCubit.productDetailsModel.data.id,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
