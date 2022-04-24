import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class DetailsOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDetailsCubit = BlocProvider.of<HistoryOrdersCubit>(context);

    return CustomCard(
      paddingTop: 10.0,
      paddingBottom: 10.0,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CustomText(
                text: 'Order number : ',
                fontSize: 20,
                textColor: mainColor,
              ),
              CustomText(
                text:
                    '${orderDetailsCubit.orderDetailsModel.orderDetails.id}',
                fontSize: 18,
              ),
              const Spacer(),
              CustomText(
                text:
                    'Date :${orderDetailsCubit.orderDetailsModel.orderDetails.date}',
                fontSize: 12,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10,
            ),
            child: Row(
              children: [
                const CustomText(
                  text: 'Status : ',
                  fontSize: 20,
                  textColor: mainColor,
                ),
                CustomText(
                  text: orderDetailsCubit
                      .orderDetailsModel.orderDetails.orderStatus,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          Row(
            children: [
              const CustomText(
                text: 'Cost : ',
                fontSize: 20,
                textColor: mainColor,
              ),
              CustomText(
                text:
                    '${orderDetailsCubit.orderDetailsModel.orderDetails.cost}',
                fontSize: 18,
              ),
              const SizedBox(height: 5),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10,
            ),
            child: Row(
              children: [
                const CustomText(
                  text: 'Vat : ',
                  fontSize: 20,
                  textColor: mainColor,
                ),
                CustomText(
                  text:
                      '${orderDetailsCubit.orderDetailsModel.orderDetails.vat}',
                  fontSize: 18,
                ),
              ],
            ),
          ),
          Row(
            children: [
              const CustomText(
                text: 'points discount : ',
                fontSize: 20,
                textColor: mainColor,
              ),
              CustomText(
                text:
                    '${orderDetailsCubit.orderDetailsModel.orderDetails.discount}',
                fontSize: 18,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10,
            ),
            child: Row(
              children: [
                const CustomText(
                  text: 'Payment method : ',
                  fontSize: 20,
                  textColor: mainColor,
                ),
                CustomText(
                  text: orderDetailsCubit
                      .orderDetailsModel.orderDetails.paymentMethod,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          const CustomDotedLine(dashColor: lightMainColor),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10,
            ),
            child: Row(
              children: [
                const CustomText(
                  text: 'Total : ',
                  fontSize: 20,
                  textColor: mainColor,
                ),
                const Spacer(),
                CustomText(
                  text:
                      '${orderDetailsCubit.orderDetailsModel.orderDetails.total} EGP',
                  fontSize: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
