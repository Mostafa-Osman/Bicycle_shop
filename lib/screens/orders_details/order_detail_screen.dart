import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class OrderDetailsScreen extends StatelessWidget {
  final orderId;

  OrderDetailsScreen({required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..getOrderDetails(orderId),
      child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {
          if (state is OrderDetailsError) {
            showToast(message: state.errorMessage, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          final orderDetailsCubit = BlocProvider.of<OrderDetailsCubit>(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: CustomText(text: 'Details Order', textColor: mainColor),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
              ),
            ),
            body: ConditionalBuilder(
              condition: (orderDetailsCubit.orderDetails != null),
              builder: (context) {
                final orderDetails = orderDetailsCubit.orderDetails;
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, right: 10.0, left: 10.0, bottom: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomCard(
                          widget: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                        text: 'Order number : ',
                                        fontSize: 20,
                                        textColor: mainColor),
                                    CustomText(
                                      text:
                                          '${orderDetailsCubit.orderDetails!.id}',
                                      fontSize: 18,
                                    ),
                                    Spacer(),
                                    CustomText(
                                        text: 'Date :${orderDetails!.date}',
                                        fontSize: 12),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Row(
                                    children: [
                                      CustomText(
                                          text: 'Status : ',
                                          fontSize: 20,
                                          textColor: mainColor),
                                      CustomText(
                                        text: '${orderDetails.status}',
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                        text: 'Cost : ',
                                        fontSize: 20,
                                        textColor: mainColor),
                                    CustomText(
                                      text: '${orderDetails.cost}',
                                      fontSize: 18,
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Row(
                                    children: [
                                      CustomText(
                                          text: 'Vat : ',
                                          fontSize: 20,
                                          textColor: mainColor),
                                      CustomText(
                                        text: '${orderDetails.vat}',
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                        text: 'points discount : ',
                                        fontSize: 20,
                                        textColor: mainColor),
                                    CustomText(
                                      text: '${orderDetails.discount}',
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Row(
                                    children: [
                                      CustomText(
                                          text: 'Payment method : ',
                                          fontSize: 20,
                                          textColor: mainColor),
                                      CustomText(
                                        text: '${orderDetails.paymentMethod}',
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ),
                                DottedLine(
                                  dashLength: 10,
                                  dashGapLength: 5,
                                  lineThickness: 1.5,
                                  dashColor: lightMainColor,
                                  dashGapColor: white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Row(
                                    children: [
                                      CustomText(
                                          text: 'Total : ',
                                          fontSize: 20,
                                          textColor: mainColor),
                                      Spacer(),
                                      CustomText(
                                        text: '${orderDetails.total} EGP',
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //address
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: CustomCard(
                            widget: Container(
                              padding:
                                  EdgeInsets.only(right: 10.0, bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(
                                            text: 'Address',
                                            fontSize: 20,
                                            textColor: mainColor),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () => orderDetailsCubit
                                                .changeAddressVisibility(),
                                            icon: orderDetailsCubit
                                                    .isAddressVisible
                                                ? Icon(
                                                    Icons
                                                        .keyboard_arrow_up_outlined,
                                                    size: 35,
                                                    color: mainColor)
                                                : Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: 35,
                                                    color: mainColor)),
                                      ],
                                    ),
                                    if (orderDetailsCubit.isAddressVisible)
                                      Row(
                                        children: [
                                          CustomText(
                                              text: 'city : ',
                                              fontSize: 20,
                                              textColor: mainColor),
                                          CustomText(
                                            text:
                                                '${orderDetails.address!.city}',
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                    if (orderDetailsCubit.isAddressVisible)
                                      Row(
                                        children: [
                                          CustomText(
                                              text: 'region : ',
                                              fontSize: 20,
                                              textColor: mainColor),
                                          CustomText(
                                            text:
                                                '${orderDetails.address!.region}',
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                    if (orderDetailsCubit.isAddressVisible)
                                      Row(
                                        children: [
                                          CustomText(
                                              text: 'more details : ',
                                              fontSize: 20,
                                              textColor: mainColor),
                                          CustomText(
                                            text:
                                                '${orderDetails.address!.details}',
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                  ]),
                            ),
                          ),
                        ),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: orderDetails.products!.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 20),
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCard(
                              widget: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        orderDetails.products![index].image!),
                                    width: 120,
                                    height: 120,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                                text: 'price : ',
                                                fontSize: 18,
                                                textColor: mainColor),
                                            CustomText(
                                              text:
                                                  '${orderDetails.products![index].price} EGP',
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 5.0),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                  text: 'Name : ',
                                                  fontSize: 16,
                                                  textColor: mainColor),
                                              Expanded(
                                                child: CustomText(
                                                  text: orderDetails
                                                      .products![index].name!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                                text: 'Quantity : ',
                                                fontSize: 20,
                                                textColor: mainColor),
                                            CustomText(
                                              text:
                                                  '${orderDetails.products![index].quantity}',
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
                        ),
                        // cancel order
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {}
                          // orderDetailsCubit.getCancelOrder(orderDetails.id)
                          ,
                          child: CustomCard(
                            widget: Padding(
                              padding: EdgeInsets.only(
                                  top: 5.0, right: 10.0, bottom: 15.0),
                              child: Row(
                                children: [
                                  CustomText(
                                      text: 'Cancel order',
                                      fontSize: 20,
                                      textColor: red),
                                  Spacer(),
                                  Icon(
                                    Icons.cancel,
                                    color: red,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
