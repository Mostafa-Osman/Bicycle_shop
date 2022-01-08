
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/my_bag/model/add_to_bag_model.dart';
import 'package:udemy_flutter/screens/my_bag/bag_cubit/states.dart';

import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class BagCubit extends Cubit<BagStates> {
  BagCubit() : super(BagInitialState());

  static BagCubit get(context) => BlocProvider.of(context);
  // int quantityOrder = 1;
  //add order to my bag
  void addToBagOrders(int productId) {
    emit(AddToBagLoadingState());
    DioHelper.postData(
      url: ADD_TO_BAG_ORDER,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      emit(AddToBagSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddToBagErrorState());
    });
  }

  //get orders to bag
  AddToBagModel? myBag;

  void getMyBagData() {
    emit(ShopGetOrderLoadingState());
    DioHelper.getData(url: ADD_TO_BAG_ORDER, token: token).then((value) {
      myBag = AddToBagModel.fromJson(value.data);

      emit(ShopGetOrderSuccessState(myBag!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetOrderErrorState());
    });
  }

  //update quantity of orders in bag

  void updateOrderData({required quantity, required int cartId}) {
    emit(BagUpdateQuantityLoadingState());
    DioHelper.putData(
        url: UPDATE_QUANTITY_ORDERS + '$cartId',
        token: token,
        data: {'quantity': quantity}).then((value) {
      myBag = AddToBagModel.fromJson(value.data);
      emit(ShopGetOrderSuccessState(myBag!));
      getMyBagData();
    }).catchError((error) {
      print(error.toString());
      emit(BagUpdateQuantityErrorState());
    });
  }

  //delete orders from bag
  void deleteOrderData({required int cartId}) {
    emit(BagUpdateQuantityLoadingState());
    DioHelper.deleteData(
      url: DELETE_ORDERS + '$cartId',
      token: token,
    ).then((value) {
      emit(DeleteFromBagSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteFromBagErrorState());
    });
  }



}