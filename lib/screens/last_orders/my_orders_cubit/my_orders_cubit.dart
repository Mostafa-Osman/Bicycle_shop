import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/last_orders/model/my_orders.dart';
import 'package:udemy_flutter/screens/last_orders/my_orders_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit() : super(MyOrdersInitialState());

  static MyOrdersCubit get(context) => BlocProvider.of(context);


  //get orders
  MyOrderModel? orders;

  void getOrders() {
    emit(ShopMyOrderLoadingState());
    DioHelper.getData(url: MAKE_ORDER, token: token).then((value) {
      orders = MyOrderModel.fromJson(value.data);
      emit(ShopMyOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopMyOrderErrorState());
    });
  }

}