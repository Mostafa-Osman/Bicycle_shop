import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsPhotos extends StatelessWidget {
  final DetailsData productDetails;

  const ProductDetailsPhotos({required this.productDetails});

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
                items: productDetails.images
                    .map(
                      (e) => SizedBox(
                        height: 250.0,
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(e.toString()),
                          fit: BoxFit.fitHeight,
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
                  // physics: null,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => (index ==
                          productDetailsCubit.indicatorIndex)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: mainColor, width: 2),
                          ),
                          child: Image(
                            image: NetworkImage(
                              productDetails.images[index].toString(),
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      : Image(
                          image: NetworkImage(
                            productDetails.images[index].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                  separatorBuilder: (_, index) => const SizedBox(width: 5),
                  itemCount: productDetails.images.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
