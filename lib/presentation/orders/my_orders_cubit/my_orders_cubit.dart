import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/orders_model/my_orders.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/my_orders_states.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit(this.ordersRepository) : super(MyOrdersInitial());


  //get orders
 late  MyOrderModel orders;
  final OrdersRepository ordersRepository;

  Future<void> getOrders() async {
    emit(MyOrderLoading());
    try {
      orders = await ordersRepository.getOrder();
      emit(MyOrderSuccess());
    } catch (error,s) {
      emit(MyOrderError(error.toString()),);
      log('get Orders data',error:error,stackTrace: s);

    }
  }
}
