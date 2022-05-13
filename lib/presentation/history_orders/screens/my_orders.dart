import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/presentation/history_orders/widgets/build_order_card.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myOrdersCubit = BlocProvider.of<HistoryOrdersCubit>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait(
          [BlocProvider.of<HistoryOrdersCubit>(context).getOrders()],
        );
      },
      child: BlocBuilder<HistoryOrdersCubit, OrderDetailsState>(
        builder: (context, state) {
          if (state is HistoryOrdersLoading) {
            return const Center(child: CustomLoading());
          } else if (state is HistoryOrdersError) {
            return NetworkDisconnected(
              onPress: () {
                BlocProvider.of<HistoryOrdersCubit>(context).getOrders();
              },
            );
          } else {
            return myOrdersCubit.orders.data.listDoneOrders.isEmpty
                ? SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: EmptyScreen(
                        onPress: () {
                          BlocProvider.of<BottomNavBarCubit>(context)
                              .changeCurrentIndex(2);
                          navigatorAndFinish(
                            context,
                            RouteConstant.shopLayoutRoute,
                          );
                        },
                      ),
                  ),
                )
                : ListView.separated(
                    padding: const EdgeInsets.only(
                      bottom: 70.0,
                      right: 10.0,
                      left: 10.0,
                    ),
                    itemBuilder: (context, index) => BuildOrderCard(
                      order: myOrdersCubit.orders.data.listDoneOrders[index],
                    ),
                    itemCount: myOrdersCubit.orders.data.listDoneOrders.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                  );
          }
        },
      ),
    );
  }
}
