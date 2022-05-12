import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/app_bar.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_description.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_button.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/product_details_photos.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

class ProductDetailsScreen extends StatelessWidget {
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
              return const Center(
                child: Text('Error'),
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
