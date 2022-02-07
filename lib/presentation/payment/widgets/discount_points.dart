import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/card_item.dart';


class DiscountPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = PaymentCubit.get(context);

    return CardItem(
      title: "Do you want to use discount points?",
      labels: cubit.labelText,
      selectedIndex: cubit.discountTabTextIndexSelected,
      selectedLabelIndex: (index) {
        cubit.changeDiscount(index);
        cubit.estimateOrdersData(
            cubit.discountTabTextIndexSelected == 0 ? true : false);
      },
    );
  }
}
