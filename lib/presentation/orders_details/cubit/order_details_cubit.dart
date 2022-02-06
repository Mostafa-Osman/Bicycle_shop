import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/data/models/order_details_model/order_detail.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);


  //pass order repo  by get it == di

  final ordersRepo = OrdersRepo();

  //order details
  OrderDetailsModel? orderDetails;
  bool isAddressVisible = false;

  Future<void> getOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    try {
      orderDetails = await ordersRepo.getOrderDetails(orderId);
      emit(OrderDetailsSuccess());
    } catch (e, s) {
      log(s.toString());
      emit(OrderDetailsError(errorMessage: e.toString()));
    }
  }

  changeAddressVisibility() {
    emit(OrderDetailsRefreshUi());

    isAddressVisible = !isAddressVisible;
  }

  //cancel order
  Future<void> cancelOrder(orderId) async {
    emit(OrderCancelLoading());
    try {
      ordersRepo.cancelOrder(orderId);
      emit(OrderCancelSuccess());
    } catch (e) {
      emit(OrderCancelError());
      rethrow;
    }
  }
}
