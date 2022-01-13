import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';

class MyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersStates>(
        builder: (context, state) {
          return state is MyOrderLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                  color: red,
                ))
              : state is MyOrderErrorState
                  ? CustomText(text: 'error 404')
                  : ListView.builder(
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
                    );
        },
        listener: (context, state) {});
  }
}

class OrdersBody extends StatelessWidget {
  final order;

  const OrdersBody({required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 30.0, bottom: 10.0, right: 10.0, left: 10.0),
      child: CustomCard(
        widget: InkWell(
          onTap: (){},
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
                    CustomText(text: 'Order number: ${order.id}', fontSize: 15),
                    SizedBox(width: 50),
                    CustomText(text: 'Date:${order.date}', fontSize: 12),
                  ],
                ),
                Row(
                  children: [
                    CustomText(text: 'Status: ${order.status}', fontSize: 15),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
                CustomText(text: 'Total: ${order.total} EGP', fontSize: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
