import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AddressDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDetailsCubit = BlocProvider.of<HistoryOrdersCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: InkWell(
        onTap: () => orderDetailsCubit.changeAddressVisibility(),
        child: CustomCard(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomText(
                    text: 'Address',
                    fontSize: 20,
                    textColor: mainColor,
                  ),
                  const Spacer(),
                  if (orderDetailsCubit.isAddressVisible)
                    const Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 35,
                      color: mainColor,
                    )
                  else
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 35,
                      color: mainColor,
                    ),
                ],
              ),
              if (orderDetailsCubit.isAddressVisible)
                Column(
                  children: [
                    const CustomDotedLine(),
                    Row(
                      children: [
                        const CustomText(
                          text: 'city : ',
                          fontSize: 20,
                          textColor: mainColor,
                        ),
                        CustomText(
                          text: orderDetailsCubit
                              .orderDetailsModel.orderDetails.address.city,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: 'region : ',
                          fontSize: 20,
                          textColor: mainColor,
                        ),
                        CustomText(
                          text: orderDetailsCubit
                              .orderDetailsModel.orderDetails.address.region,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: 'more details : ',
                          fontSize: 20,
                          textColor: mainColor,
                        ),
                        CustomText(
                          text: orderDetailsCubit
                              .orderDetailsModel.orderDetails.address.details,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
