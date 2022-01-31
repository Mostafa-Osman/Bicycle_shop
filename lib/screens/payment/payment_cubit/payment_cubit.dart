import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/basket/model/add_order_model.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  bool isOnline = false;
  int discountTabTextIndexSelected = 1;
  int voucherTabTextIndexSelected = 1;
  String? cardNumber;
  String? expiryDate;
  String? cardHolderName;
  String? cvvCode;
  bool isCvvFocused = false;
  TabController? tabController;
  ValueNotifier<int> current = ValueNotifier(0);
  var labelText = ["Yes", "No"];

  isOnlinePayment() {
    emit(IsOnlineState());
    isOnline = !isOnline;
  }

  //credit card
  onCreditCardModelChange(creditCardModel) {
    emit(CreditCardModelChangeSuccess());
    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
  }

  changeDiscount(index) {
    emit(SwitchDiscountState());
    discountTabTextIndexSelected = index;
  }

  changeVoucher(index) {
    emit(SwitchVoucherState());
    voucherTabTextIndexSelected = index;
  }

  //complete make order and add to get it

  AddOrderModel? makeOrders;

  void makeOrderData(addressId, paymentMethod, usePoints) {
    emit(MakeOrderLoadingState());
    DioHelper.postData(
      url: ADD_ORDER,
      data: {
        'address_id': addressId,
        'payment_method': paymentMethod,
        'use_points': usePoints,
      },
      token: token,
    ).then((value) {
      makeOrders = AddOrderModel.fromJson(value.data);
      emit(MakeOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MakeOrderErrorState());
    });
  }

  int addressIndex = 0;

  changeAddressIndex(index) {
    addressIndex = index;
    emit(ChangeAddressIndex());
  }
}
