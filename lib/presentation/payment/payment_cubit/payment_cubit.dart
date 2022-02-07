import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/basket_model/add_order_model.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';
import 'package:udemy_flutter/data/models/payment_model/promo_code.dart';
import 'package:udemy_flutter/data/repository/payment_repo/payment_repo.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/states.dart';
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
  final paymentRepo = PaymentRepo();

  Future<void> makeOrderData(addressId, paymentMethod, usePoints) async {
    emit(MakeOrderLoadingState());
    try {
      makeOrders =
          await paymentRepo.makeOrderData(addressId, paymentMethod, usePoints);
      emit(MakeOrderSuccessState());
    } catch (e, s) {
      print(s.toString());
      emit(MakeOrderErrorState());
    }
  }

  EstimateModel? estimatePrice;

  Future<void> estimateOrdersData(usePoints
    //  , promoCodeId
      ) async {
    emit(EstimateOrderLoading());
    try {
      estimatePrice =
          await paymentRepo.estimateOrdersData(usePoints
           //   , promoCodeId
          );
      emit(EstimateOrderSuccess());
    } catch (e, s) {
      print(s.toString());
      emit(EstimateOrderError());
    }
  }

  PromoCodeModel? promoCodeModel;

  Future<void> promoCode(code) async {
    emit(PromoCodeLoading());
    try {
      promoCodeModel = await PaymentRepo().promoCode(code);
      emit(PromoCodeSuccess());
    } catch (e, s) {
      print(s.toString());
      emit(PromoCodeError());
    }
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
