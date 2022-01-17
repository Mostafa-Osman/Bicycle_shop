import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/screens/orders/model/order_detail.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
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

  // //cancel order
  // void getCancelOrder(index) {
  //   emit(OrderCancelLoadingState());
  //   DioHelper.getData(url: 'orders/' + '${index}' + '/cancel', token: token)
  //       .then((value) {
  //     emit(OrderCancelSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(OrderCancelErrorState());
  //   });
  // }
}
