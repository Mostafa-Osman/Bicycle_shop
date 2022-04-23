import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/history_orders_model/history_orders.dart';
import 'package:udemy_flutter/data/models/order_details_model/order_detail.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';

part 'history_orders_state.dart';

class HistoryOrdersCubit extends Cubit<OrderDetailsState> {
  HistoryOrdersCubit(this.ordersDetailsRepository)
      : super(OrderDetailsInitial());

  //order details
  late OrderDetailsModel orderDetailsModel;
  bool isAddressVisible = false;
  final OrdersRepository ordersDetailsRepository;
  late HistoryOrdersModel orders;

  Future<void> getOrders() async {
    emit(HistoryOrdersLoading());
    try {
      orders = await ordersDetailsRepository.getOrder();
      emit(HistoryOrdersSuccess());
    } catch (error, s) {
      emit(
        HistoryOrdersError(error.toString()),
      );
      log('get Orders data', error: error, stackTrace: s);
    }
  }

  Future<void> getOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    try {
      orderDetailsModel =
          await ordersDetailsRepository.getOrderDetails(orderId);
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
  Future<void> cancelOrder() async {
    emit(OrderCancelLoading());
    try {
      await ordersDetailsRepository
          .cancelOrder(orderDetailsModel.orderDetails.id);
      getOrders();
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
