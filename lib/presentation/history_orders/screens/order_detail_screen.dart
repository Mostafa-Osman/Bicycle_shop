import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/presentation/history_orders/widgets/cancel_order.dart';
import 'package:udemy_flutter/presentation/history_orders/widgets/details_order.dart';
import 'package:udemy_flutter/presentation/history_orders/widgets/products_order_details.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';
import 'package:udemy_flutter/shared/components/toast.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int orderId;

  const OrderDetailsScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: 'Details Order',
          textColor: mainColor,
          fontSize: 20.0,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: BlocConsumer<HistoryOrdersCubit, OrderDetailsState>(
        listener: (context, state) {
          if (state is OrderCancelSuccess) {
            showToast(
              message: 'order canceled successfully',
              state: ToastStates.success,
            );
            Navigator.pop(context);
          }
          if (state is OrderDetailsError || state is OrderCancelError) {
            showToast(
              message: 'something wrong try again later',
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          final orderDetailsCubit =
              BlocProvider.of<HistoryOrdersCubit>(context);
          if (state is OrderDetailsLoading) {
            return const Center(
              child: CustomLoading(),
            );
          } else if (state is OrderDetailsError) {
            return NetworkDisconnected(
              onPress: () {
                BlocProvider.of<HistoryOrdersCubit>(context)
                    .getOrderDetails(orderId);
              },
            );
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
                                    const CustomDotedLine(
                                      dashColor: lightMainColor,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      children: [
                                        const CustomText(
                                          text: 'city : ',
                                          fontSize: 20,
                                          textColor: mainColor,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: CustomText(
                                            text: orderDetailsCubit
                                                .orderDetailsModel
                                                .orderDetails
                                                .address
                                                .city,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    CustomDotedLine(
                                      lineThickness: 1.0,
                                      dashColor: Colors.grey[400]!,
                                    ),
                                    Row(
                                      children: [
                                        const CustomText(
                                          text: 'region : ',
                                          fontSize: 20,
                                          textColor: mainColor,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          padding: const EdgeInsets.only(
                                            top: 10.0,
                                            bottom: 10.0,
                                          ),
                                          child: CustomText(
                                            text: orderDetailsCubit
                                                .orderDetailsModel
                                                .orderDetails
                                                .address
                                                .region,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomDotedLine(
                                      lineThickness: 1.0,
                                      dashColor: Colors.grey[400]!,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      children: [
                                        const CustomText(
                                          text: 'more details : ',
                                          fontSize: 20,
                                          textColor: mainColor,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: CustomText(
                                            text: orderDetailsCubit
                                                .orderDetailsModel
                                                .orderDetails
                                                .address
                                                .details,
                                            fontSize: 18,
                                          ),
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

                    //product order details
                    ProductsOrderDetails(),
                    // cancel order
                    const SizedBox(height: 10),
                    if (orderDetailsCubit
                            .orderDetailsModel.orderDetails.orderStatus ==
                        'New')
                      CancelOrder(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
