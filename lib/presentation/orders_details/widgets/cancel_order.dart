import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CancelOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final orderDetailsCubit =BlocProvider.of<OrderDetailsCubit>(context);

    return   InkWell(
      onTap: () {
        orderDetailsCubit.cancelOrder(orderDetailsCubit.orderDetailsModel.orderDetails.id);
        Navigator.pop(context);
      },
      child: CustomCard(
        widget: Padding(
          padding: const EdgeInsets.only(
              top: 5.0, right: 10.0, bottom: 15.0,),
          child: Row(
            children: const [
              CustomText(
                  text: 'Cancel order',
                  fontSize: 20,
                  textColor: red,),
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
