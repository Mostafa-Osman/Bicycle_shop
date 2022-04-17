import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/my_orders_cubit.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/my_orders_states.dart';
import 'package:udemy_flutter/presentation/orders/widgets/build_order_card.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myOrdersCubit = BlocProvider.of<MyOrdersCubit>(context);
    return BlocBuilder<MyOrdersCubit, MyOrdersStates>(
      builder: (context, state) {
        if (state is MyOrderLoading) {
          return const Center(child: CustomLoading());
        } else if (state is MyOrderError) {
          return const Text('error');
        } else {
          return myOrdersCubit.orders.data.listDoneOrders.isEmpty
              ? EmptyScreen()
              : Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(
                    bottom: 15.0,
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) => BuildOrderCard(
                      order: myOrdersCubit.orders.data.listDoneOrders[index],
                    ),
                    itemCount: myOrdersCubit.orders.data.listDoneOrders.length,
                  ),
                );
        }
      },
    );
  }
}
