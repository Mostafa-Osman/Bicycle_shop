import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';

class SelectPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    final checkBoxController = GroupController();

    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (BuildContext context, state) {
        return CustomCard(
          height: 170,
          paddingLeft: 0.0,
          paddingRight: 0.0,
          paddingTop: 5.0,
          widget: SimpleGroupedCheckbox(
            checkFirstElement: true,
            controller: checkBoxController,
            itemsSubTitle: const [
              'The delivery staff goes to your door,you give the money according to the value of the application and delivery fees for employees',
              'We will call you back to confirm the order,After confirmation,we will proceed to pick up,pack,issue bills and will notify the actual bill for you to transfer'
            ],
            onItemSelected: (_) => paymentCubit.isOnlinePayment(),
            itemsTitle: const ["cash", "Online"],
            values: const ["cash", "Online"],
            groupStyle: GroupStyle(
              activeColor: Colors.green,
              itemTitleStyle: const TextStyle(fontSize: 20.0),
            ),
          ),
        );
      },
    );
  }
}
