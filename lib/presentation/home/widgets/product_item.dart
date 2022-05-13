import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_favourite_icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final data =
        BlocProvider.of<HomeCubit>(context).homeModel.data.detailsData[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<ProductDetailsCubit>(context)
              .changeSmallPhotoIndex(0);
          BlocProvider.of<ProductDetailsCubit>(context)
              .getProductDetailsData(productId: data.id);
          navigateWithArgument(
            context,
            RouteConstant.productDetailsRoute,
            data.id,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    height: 130.0,
                    width: double.infinity,
                    imageUrl: data.image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Container(
                      height: 130.0,
                      color: Colors.white,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[100]!,
                        highlightColor: Colors.grey[300]!,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                  ),
                  if (data.discount != 0)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                        child: SvgPicture.asset(
                          'assets/icons/discount.svg',
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                ],
              ),
              if (index.isOdd)
                const SizedBox(
                  height: 30.0,
                ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: data.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      height: 1.3,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'EGP ${data.price}',
                              fontSize: 14,
                              height: 1.3,
                              fontWeight: FontWeight.bold,
                              textColor: mainColor,
                            ),
                            if (data.discount != 0)
                              CustomText(
                                text: ' ${data.oldPrice} EGP',
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13,
                                height: 1.3,
                                textColor: grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                          ],
                        ),
                        const Spacer(),
                        CustomFavouriteIcon(
                          productId: data.id,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
