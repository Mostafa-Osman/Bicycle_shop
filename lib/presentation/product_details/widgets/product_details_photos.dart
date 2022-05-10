import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //photo
              CarouselSlider(
                items: productDetailsCubit.productDetailsModel.data.images
                    .map(
                      (e) => CachedNetworkImage(
                        height: 250.0,
                        width: double.infinity,
                        imageUrl: e.toString(),
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[100]!,
                          highlightColor: Colors.grey[300]!,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 200.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, _) {
                    return productDetailsCubit.changeSmallPhotoIndex(index);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 50.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => (index ==
                          productDetailsCubit.indicatorIndex)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: mainColor, width: 2),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: productDetailsCubit
                                .productDetailsModel.data.images[index]
                                .toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[100]!,
                              highlightColor: Colors.grey[300]!,
                              child: Image.asset(
                                'assets/images/logo.png',
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                            ),
                          ),
                        )
                      :  CachedNetworkImage(
                    imageUrl: productDetailsCubit
                        .productDetailsModel.data.images[index]
                        .toString(),
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.grey[300]!,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                  ),
                  separatorBuilder: (_, index) => const SizedBox(width: 15),
                  itemCount: productDetailsCubit
                      .productDetailsModel.data.images.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
