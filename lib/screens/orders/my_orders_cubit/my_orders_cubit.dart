import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/screens/orders/model/my_orders.dart';
import 'package:udemy_flutter/screens/orders/my_orders_cubit/states.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit() : super(MyOrdersInitialState());

  static MyOrdersCubit get(context) => BlocProvider.of(context);

  //get orders
  MyOrderModel? order;
  final ordersRepo = OrdersRepo();

  Future<void> getOrders() async {
    emit(MyOrderLoadingState());
    try {
      order = await ordersRepo.getOrder();
      emit(MyOrderSuccessState());
    } catch (e) {
      emit(MyOrderErrorState());

      rethrow;
    }
  }
}
