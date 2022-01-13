import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/last_orders/model/my_orders.dart';
import 'package:udemy_flutter/screens/last_orders/model/order_detail.dart';
import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit() : super(MyOrdersInitialState());

  static MyOrdersCubit get(context) => BlocProvider.of(context);
  bool addressIsVisible = false;

  //get orders
  MyOrderModel? orders;

  void getOrders() {
    emit(MyOrderLoadingState());
    DioHelper.getData(url: MY_ORDERS, token: token).then((value) {
      orders = MyOrderModel.fromJson(value.data);
      emit(MyOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MyOrderErrorState());
    });
  }

  //order details
  OrderDetailsModel? orderDetails;

  void getOrderDet(productId) {
    emit(OrderDetailsLoadingState());
    DioHelper.getData(url: ORDER_DETAILS + '$productId', token: token)
        .then((value) {
      orderDetails = OrderDetailsModel.fromJson(value.data);
      emit(OrderDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OrderDetailsErrorState());
    });
  }

  changeAddressVisibility() {
    emit(ChangeAddressVisibilityState());

    addressIsVisible = !addressIsVisible;
  }
}
