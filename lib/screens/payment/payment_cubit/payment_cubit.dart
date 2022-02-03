import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/basket/model/add_order_model.dart';
import 'package:udemy_flutter/screens/payment/model/estimate.dart';
import 'package:udemy_flutter/screens/payment/model/promo_code.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  bool isOnline = false;
  int discountTabTextIndexSelected = 1;
  int voucherTabTextIndexSelected = 1;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  var labelText = ["Yes", "No"];

  isOnlinePayment() {
    isOnline = !isOnline;
    emit(IsOnlineState());
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
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(MakeOrderErrorState());
    });
  }

  EstimateModel? estimatePrice;

  void estimateOrdersData(usePoints , promoCodeId
      ) {
    emit(EstimateOrderLoading());
    DioHelper.postData(
      url: ESTIMATE_ORDER,
      data: {
        'use_points': usePoints,
        'promo_code_id': promoCodeId,
      },
      token: token,
    ).then((value) {
      estimatePrice = EstimateModel.fromJson(value.data);
      emit(EstimateOrderSuccess());
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(EstimateOrderError());
    });
  }

  PromoCodeModel? promoCodeModel;

  void promoCode(code) {
    emit(PromoCodeLoading());
    DioHelper.postData(
      url: PROMO_CODE,
      data: {
        'code': code,
      },
      token: token,
    ).then((value) {
      promoCodeModel = PromoCodeModel.fromJson(value.data);
      emit(PromoCodeSuccess());
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(PromoCodeError());
    });
  }

  int addressIndex = 0;

  changeAddressIndex(index) {
    addressIndex = index;
    emit(ChangeAddressIndex());
  }

  Color backgroundTextAddress = Color(0xffE0E0E0);
  Color textColor = black;

  void addressStyle(index) {
    if (addressIndex == index) {
      backgroundTextAddress = lightMainColor;
      textColor = mainColor;
    } else {
      textColor = black;
      backgroundTextAddress = Color(0xffE0E0E0);
    }
    emit(AddressStyleState());
  }
}
