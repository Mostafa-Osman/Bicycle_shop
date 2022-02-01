import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/screens/orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: state is! MyOrderLoadingState,
              builder: (context) {
                return MyOrdersCubit.get(context)
                        .orders!
                        .data!
                        .listDoneOrders
                        .isEmpty
                    ? EmptyScreen()
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(
                            bottom: 15.0, right: 10.0, left: 10.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) => OrdersBody(
                              order: MyOrdersCubit.get(context)
                                  .orders!
                                  .data!
                                  .listDoneOrders[index]),
                          itemCount: MyOrdersCubit.get(context)
                              .orders!
                              .data!
                              .listDoneOrders
                              .length,
                        ),
                      );
              },
              fallback: (context) {
                return Center(
                    child:CustomLoading());
              });
        });
  }
}

class OrdersBody extends StatelessWidget {
  final order;

  OrdersBody({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          widget: InkWell(
            onTap: () => navigateWithArgument(
                context, RouteConstant.orderDetailsRoute, order.id),
            child: Container(
              height: 90,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          text: 'Order number : ${order.id}', fontSize: 15),
                      SizedBox(width: 50),
                      CustomText(text: 'Date :${order.date}', fontSize: 12),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Status : ${order.status}', fontSize: 15),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, color: mainColor),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomDotedLine(dashColor:lightMainColor),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomText(
                          text: 'Total : ', textColor: mainColor, fontSize: 20),
                      Spacer(),
                      CustomText(text: '${order.total} EGP', fontSize: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
