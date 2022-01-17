import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/orders/model/my_orders.dart';
import 'package:udemy_flutter/screens/orders/my_orders_cubit/states.dart';

import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit() : super(MyOrdersInitialState());

  static MyOrdersCubit get(context) => BlocProvider.of(context);

  //get orders
  MyOrderModel? order;

  void getOrders() {
    emit(MyOrderLoadingState());
    DioHelper.getData(url: MY_ORDERS, token: token).then((value) {
      order = MyOrderModel.fromJson(value.data);
      emit(MyOrderSuccessState());
    }).catchError((error, s) {
      log(s);
      print(error.toString());
      emit(MyOrderErrorState());
    });
  }


}
