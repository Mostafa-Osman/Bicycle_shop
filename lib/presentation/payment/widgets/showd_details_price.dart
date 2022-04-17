import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/payment_model/estimate.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_alert_dialog.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ShowDetailsPrice extends StatelessWidget {
  final EstimateData detailsPrice;

  const ShowDetailsPrice({required this.detailsPrice});

  @override
  Widget build(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return CustomAlertDialog(
      height: 180,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const CustomText(
                  text: 'Cost : ',
                  fontSize: 20,
                  textColor: mainColor,
                ),
                CustomText(
                  text: '${basketCubit.myBag.data.total}',
                  fontSize: 18,
                ),
                const SizedBox(height: 5),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                children: [
                  const CustomText(
                    text: 'Vat : ',
                    fontSize: 20,
                    textColor: mainColor,
                  ),
                  CustomText(
                    text:
                        '${detailsPrice.total - detailsPrice.subTotal + detailsPrice.points}',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const CustomText(
                  text: 'points discount : ',
                  fontSize: 20,
                  textColor: mainColor,
                ),
                CustomText(
                  text: paymentCubit.discountTabTextIndexSelected == 0
                      ? '${detailsPrice.points}'
                      : '0',
                  fontSize: 18,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                children: [
                  const CustomText(
                    text: 'Total : ',
                    fontSize: 20,
                    textColor: mainColor,
                  ),
                  CustomText(
                    text: '${detailsPrice.total} EGP',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
