import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/card_item.dart';
import 'package:udemy_flutter/presentation/payment/widgets/promo_code.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';

class DiscountAndVoucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return CustomCard(
      height: paymentCubit.usePromoCode == 0
          ? MediaQuery.of(context).size.height * 0.21
          : MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      paddingLeft: 15.0,
      paddingTop: 10.0,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardItem(
            title: "Do you want to use discount points?",
            labels: paymentCubit.labelText,
            selectedIndex: paymentCubit.enableDiscountPoints,
            selectedLabelIndex: (int index) {
              paymentCubit.changeDiscountPoints(index);
              paymentCubit.estimateOrdersData();
            },
          ),
          const SizedBox(height: 20.0),
          CardItem(
            title: "Do you want to use promo code?",
            labels: paymentCubit.labelText,
            selectedIndex: paymentCubit.usePromoCode,
            selectedLabelIndex: (int index) {
              paymentCubit.changePromoCode(index);
            },
          ),
          const SizedBox(height: 20.0),
          if (paymentCubit.usePromoCode == 0) PromoCode(),
        ],
      ),
    );
  }
}
