import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/history_orders/history_orders_cubit/history_orders_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CancelOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDetailsCubit = BlocProvider.of<HistoryOrdersCubit>(context);
    return InkWell(
      onTap: () => orderDetailsCubit.cancelOrder(),
      child: CustomCard(
        paddingTop: 15.0,
        paddingBottom: 15.0,
        widget: Row(
          children: const [
            CustomText(
              text: 'Cancel order',
              fontSize: 20,
              textColor: red,
            ),
            Spacer(),
            Icon(
              Icons.cancel,
              color: red,
            )
          ],
        ),
      ),
    );
  }
}
