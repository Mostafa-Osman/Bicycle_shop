import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/end_orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/screens/end_orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class MyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersStates>(
        builder: (context, state) {
          return Scaffold(
            body: state is ShopMyOrderLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                    color: red,
                  ))
                : state is ShopMyOrderErrorState
                    ? CustomText(text:'error 404')
                    : ListView.separated(
                        itemBuilder: (context, index) => buildListOrders(
                            MyOrdersCubit.get(context)
                                .orders!
                                .data!
                                .allOrders[index]),
                        separatorBuilder: (context, index) =>
                            CustomDivider(color: mainColor),
                        itemCount: MyOrdersCubit.get(context)
                            .orders!
                            .data!
                            .allOrders
                            .length),
          );
        },
        listener: (context, state) {});
  }

  buildListOrders(order) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(text: 'Order no: ${order.id}', fontSize: 15),
                // SizedBox(width: 50),
                Spacer(),
                CustomText(text: 'Date:${order.date}', fontSize: 12),
              ],
            ),
            Row(
              children: [
                CustomText(text: 'Status:${order.status}', fontSize: 15),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined)),
              ],
            ),
            CustomText(text: 'Total: ${order.total}', fontSize: 15),
          ],
        ),
      ),
    );
  }
}
