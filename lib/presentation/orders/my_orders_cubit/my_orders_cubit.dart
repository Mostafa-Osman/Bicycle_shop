import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/orders_repo/orders_repo.dart';
import 'package:udemy_flutter/data/models/orders_model/my_orders.dart';
import 'package:udemy_flutter/presentation/orders/my_orders_cubit/states.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit() : super(MyOrdersInitialState());

  static MyOrdersCubit get(context) => BlocProvider.of(context);

  //get orders
  MyOrderModel? orders;
  final ordersRepo = OrdersRepo();

  Future<void> getOrders() async {
    emit(MyOrderLoadingState());
    try {
      orders = await ordersRepo.getOrder();
      emit(MyOrderSuccessState());
    } catch (e) {
      emit(MyOrderErrorState());

      rethrow;
    }
  }
}
