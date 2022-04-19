import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/order_details_model/order_detail.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.ordersDetailsRepository)
      : super(OrderDetailsInitial());

  final OrdersRepository ordersDetailsRepository;

  //order details
  late OrderDetailsModel orderDetailsModel;
  bool isAddressVisible = false;

  Future<void> getOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    try {
      orderDetailsModel = await ordersDetailsRepository.getOrderDetails(orderId);
      emit(OrderDetailsSuccess());
    } catch (e, s) {
      log('get order details data', error: e.toString(), stackTrace: s);
      emit(OrderDetailsError(errorMessage: e.toString()));
    }
  }

  void changeAddressVisibility() {
    emit(OrderDetailsRefreshUi());
    isAddressVisible = !isAddressVisible;
  }

  //cancel order
  Future<void> cancelOrder(int orderId) async {
    emit(OrderCancelLoading());
    try {
      ordersDetailsRepository.cancelOrder(orderId);
      emit(OrderCancelSuccess());
    } catch (e, s) {
      log('cancel order data', error: e.toString(), stackTrace: s);

      emit(
        OrderCancelError(errorMessage: e.toString()),
      );
      rethrow;
    }
  }
}
