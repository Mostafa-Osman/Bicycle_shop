import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/screens/payment/widgets/credit_card.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';

class SelectPaymentMethod extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = PaymentCubit.get(context);
    final checkBoxController = GroupController();

    return Column(children: [
      CustomCard(
        widget: SizedBox(
          height: 170,
          child: SimpleGroupedCheckbox(
            checkFirstElement: true,
            controller: checkBoxController,
            itemsSubTitle: [
              'The delivery staff goes to your door,you give the money according to the value of the application and delivery fees for employees',
              'We will call you back to confirm the order,After confirmation,we will proceed to pick up,pack,issue bills and will notify the actual bill for you to transfer'
            ],
            onItemSelected: (_) => cubit.isOnlinePayment(),
            itemsTitle: ["cash", "Online"],
            values: ["cash", "Online"],
            groupStyle: GroupStyle(
                activeColor: Colors.blue,
                itemTitleStyle: TextStyle(fontSize: 20.0)),
          ),
        ),
      ),
      if (cubit.isOnline)
        Padding(
          padding:
          const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: CreditCard(),
        ),
    ]);
  }
}
