import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
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
          const SizedBox(height: 20),
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          widget: Row(
            children: [
              Image(
                image: NetworkImage(
                  orderDetailsCubit
                      .orderDetailsModel.orderDetails.products[index].image,
                ),
                width: 120,
                height: 120,
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
                            fontSize: 16,
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
        );
      },
    );
  }
}
