import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/presentation/layout/layout_cubit/layout_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/address.dart';
import 'package:udemy_flutter/presentation/payment/widgets/bottom_nav.dart';
import 'package:udemy_flutter/presentation/payment/widgets/discount_and_voucher.dart';
import 'package:udemy_flutter/presentation/payment/widgets/select_payment__method.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/tosast.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Payment',
          textColor: mainColor,
          fontSize: 20.0,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is MakeOrderSuccess) {
            showToast(
              message: 'order completed successfully',
              state: ToastStates.success,
            );
            BlocProvider.of<HistoryOrdersCubit>(context).getOrders();
            BlocProvider.of<BasketCubit>(context).getMyBasketData();
            BlocProvider.of<LayoutCubit>(context).changeCurrentIndex(3);
            navigatorAndFinish(context, RouteConstant.shopLayoutRoute);
          }
        },
        builder: (context, state) {
          if (state is EstimateOrderError) {
            return const Text('Error');
          } else if (BlocProvider.of<PaymentCubit>(context).estimatePrice ==
                  null
              //state is EstimateOrderLoading
              ) {
            return const Center(child: CustomLoading());
          } else {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            SelectPaymentMethod(),
                            const SizedBox(height: 10.0),
                            DiscountAndVoucher(),
                            const SizedBox(height: 10.0),
                            AddressPayment(),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PaymentBottomNavBar()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
