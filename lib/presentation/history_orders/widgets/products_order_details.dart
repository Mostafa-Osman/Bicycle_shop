import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductsOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDetailsCubit = BlocProvider.of<HistoryOrdersCubit>(context);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          orderDetailsCubit.orderDetailsModel.orderDetails.products.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 5.0),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            navigateWithArgument(
              context,
              RouteConstant.productDetailsRoute,
              orderDetailsCubit
                  .orderDetailsModel.orderDetails.products[index].id,
            );
            await BlocProvider.of<ProductDetailsCubit>(context)
                .getProductDetailsData(
              productId: orderDetailsCubit
                  .orderDetailsModel.orderDetails.products[index].id,
            );
          },
          child: CustomCard(
            paddingTop: 10.0,
            paddingBottom: 10.0,
            widget: Row(
              children: [
                CachedNetworkImage(
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  imageUrl: orderDetailsCubit
                      .orderDetailsModel.orderDetails.products[index].image,
                  placeholder: (context, url) => Container(
                    width: 120,
                    height: 120,
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CustomText(
                            text: 'price : ',
                            fontSize: 18,
                            textColor: mainColor,
                          ),
                          CustomText(
                            text:
                                '${orderDetailsCubit.orderDetailsModel.orderDetails.products[index].price} EGP',
                            fontSize: 16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 5.0,
                        ),
                        child: Row(
                          children: [
                            const CustomText(
                              text: 'Name : ',
                              fontSize: 18,
                              textColor: mainColor,
                            ),
                            Expanded(
                              child: CustomText(
                                text: orderDetailsCubit.orderDetailsModel
                                    .orderDetails.products[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: 'Quantity : ',
                            fontSize: 20,
                            textColor: mainColor,
                          ),
                          CustomText(
                            text:
                                '${orderDetailsCubit.orderDetailsModel.orderDetails.products[index].quantity}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            height: 1.3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
