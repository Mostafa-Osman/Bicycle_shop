import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/presentation/orders/widgets/build_order_card.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition:
              MyOrdersCubit.get(context).orders!=null,
              builder: (context) {
                return MyOrdersCubit.get(context).orders!.data!.listDoneOrders.isEmpty
                    ? EmptyScreen()
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(
                            bottom: 15.0, right: 10.0, left: 10.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) => BuildOrderCard(
                              order: MyOrdersCubit.get(context).orders!.data!.listDoneOrders[index]),
                          itemCount: MyOrdersCubit.get(context).orders!.data!.listDoneOrders.length,
                        ),
                      );
              },
              fallback: (context) {
                return Center(child: CustomLoading());
              });
        });
  }
}
