import 'package:flutter/material.dart';
import 'package:udemy_flutter/screens/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CancelOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit =OrderDetailsCubit.get(context);

    return   InkWell(
      onTap: () {
        cubit.cancelOrder(cubit.orderDetails!.id);
        Navigator.pop(context);
      },
      child: CustomCard(
        widget: Padding(
          padding: EdgeInsets.only(
              top: 5.0, right: 10.0, bottom: 15.0),
          child: Row(
            children: [
              CustomText(
                  text: 'Cancel order',
                  fontSize: 20,
                  textColor: red),
              Spacer(),
              Icon(
                Icons.cancel,
                color: red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
