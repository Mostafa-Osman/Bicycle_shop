import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/presentation/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/presentation/orders_details/widgets/details_order.dart';
import 'package:udemy_flutter/presentation/orders_details/widgets/products_order_details.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';

import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int orderId;

  const OrderDetailsScreen({required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(text: 'Details Order', textColor: mainColor),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      //todo handle Bloc Provider

      body: BlocProvider(
        create: (context) =>
            OrderDetailsCubit(OrdersRepository())..getOrderDetails(orderId),
        child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
          listener: (context, state) {
            if (state is OrderDetailsError) {
              showToast(message: state.errorMessage, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            final orderDetailsCubit =
                BlocProvider.of<OrderDetailsCubit>(context);
            if (state is OrderDetailsLoading) {
              return const Center(
                child: CustomLoading(),
              );
            } else if (state is OrderDetailsError) {
              return const Text('Error');
            } else {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  right: 10.0,
                  left: 10.0,
                  bottom: 20.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //details order
                      DetailsOrder(),
                      //address
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: InkWell(
                          onTap: () =>
                              orderDetailsCubit.changeAddressVisibility(),
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
                                                .orderDetailsModel
                                                .orderDetails
                                                .address
                                                .city,
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
                                                .orderDetailsModel
                                                .orderDetails
                                                .address
                                                .region,
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
                                                .orderDetailsModel
                                                .orderDetails
                                                .address
                                                .details,
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
                      ),
                      // AddressDetails(
                      //     // addersDetails:
                      //     //     orderDetailsCubit.orderDetails!.address
                      //   ),
                      //product order details
                      ProductsOrderDetails(),
                      // cancel order
                      const SizedBox(height: 10),
                      // if (orderDetailsCubit.orderDetailsModel.status == 'New')
                      //   CancelOrder(),

                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
