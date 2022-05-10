import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/basket/widgets/alert__dialog.dart';
import 'package:udemy_flutter/presentation/basket/widgets/change_quantity_product.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BasketItem extends StatelessWidget {
  final int index;

  const BasketItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final data =
        BlocProvider.of<BasketCubit>(context).myBag.data.cartItems[index];
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<ProductDetailsCubit>(context)
              .getProductDetailsData(productId: data.product.id);
          navigateTo(context, RouteConstant.productDetailsRoute);
        },
        child: CustomCard(
          height: 140,
          paddingTop: 15.0,
          paddingBottom: 10.0,
          widget: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  CachedNetworkImage(
                    height: 80.0,  width: 80.0,
                    imageUrl:data.product.image,
                    placeholder: (context, url) => Container(
                      height: 80.0,  width: 80.0,
                      color: Colors.white,

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
                  if (data.product.discount != 0)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset(
                        'assets/icons/discount.svg',
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'EGP ${data.product.price.toString()}',
                          fontSize: 15.0,
                          height: 1.0,
                          fontWeight: FontWeight.w600,
                          textColor: mainColor,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (data.product.discount != 0)
                          CustomText(
                            text: 'EGP ${data.product.oldPrice.toString()}',
                            fontSize: 13.0,
                            height: 1.0,
                            textColor: grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        // const Spacer(),
                        // CustomFavouriteIcon(
                        //   productId: data.product.id,
                        // ),
                        // const SizedBox(
                        //   width: 8.0,
                        // )
                      ],
                    ),
                    //product name
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: CustomText(
                        text: data.product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13.0,
                        height: 1.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 30.0),
                          ChangeQuantityProduct(
                            index: index,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MyDialog(model: data);
                              },
                            ),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
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
