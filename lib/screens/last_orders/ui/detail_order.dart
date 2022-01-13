import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class DetailsOrder extends StatelessWidget {
  final index;

  const DetailsOrder({required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersStates>(
        builder: (context, state) {
          var order = MyOrdersCubit.get(context).orderDetails!.data;
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
              condition: (MyOrdersCubit.get(context).orderDetails != null),
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
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
                                    text: '${order!.id}',
                                    fontSize: 18,
                                  ),
                                  Spacer(),
                                  CustomText(
                                      text: 'Date :${order.date}',
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
                                      text: '${order.status}',
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
                                    text: '${order.cost}',
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
                                      text: '${order.vat}',
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
                                    text: '${order.discount}',
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
                                      text: '${order.paymentMethod}',
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
                                      text: '${order.total} EGP',
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
                            padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
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
                                          onPressed: () =>
                                              MyOrdersCubit.get(context)
                                                  .changeAddressVisibility(),
                                          icon: MyOrdersCubit.get(context)
                                                  .addressIsVisible
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
                                  if (MyOrdersCubit.get(context)
                                      .addressIsVisible)
                                    Row(
                                      children: [
                                        CustomText(
                                            text: 'city : ',
                                            fontSize: 20,
                                            textColor: mainColor),
                                        CustomText(
                                          text: '${order.address!.city}',
                                          fontSize: 18,
                                        ),
                                      ],
                                    ),
                                  if (MyOrdersCubit.get(context)
                                      .addressIsVisible)
                                    Row(
                                      children: [
                                        CustomText(
                                            text: 'region : ',
                                            fontSize: 20,
                                            textColor: mainColor),
                                        CustomText(
                                          text: '${order.address!.region}',
                                          fontSize: 18,
                                        ),
                                      ],
                                    ),
                                  if (MyOrdersCubit.get(context)
                                      .addressIsVisible)
                                    Row(
                                      children: [
                                        CustomText(
                                            text: 'more details : ',
                                            fontSize: 20,
                                            textColor: mainColor),
                                        CustomText(
                                          text: '${order.address!.details}',
                                          fontSize: 18,
                                        ),
                                      ],
                                    ),
                                ]),
                          ),
                        ),
                      ),

                      CustomCard(
                        widget: Row(
                          children: [
                            Image(
                              image:
                                  NetworkImage(order.products![1].image!),
                              width: 120,
                              height: 120,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          text: 'price : ',
                                          fontSize: 18,
                                          textColor: mainColor),
                                      CustomText(
                                        text:
                                            '${order.products![1].price} EGP',
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
                                            text: order.products![index].name!,
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
                                      CustomText(
                                          text: 'Quantity : ',
                                          fontSize: 20,
                                          textColor: mainColor),
                                      CustomText(
                                        text:
                                            '${order.products![index].quantity}',
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
                      //cancel order
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () =>
                            MyOrdersCubit.get(context).getCancelOrder(order.id),
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
                );
              },
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
        listener: (context, state) => {});
  }
}
