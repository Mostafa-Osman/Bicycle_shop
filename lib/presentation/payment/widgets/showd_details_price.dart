import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_alert_dialog.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ShowDetailsPrice extends StatelessWidget {
  final detailsPrice;

  const ShowDetailsPrice({required this.detailsPrice});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      height: 180,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(text: 'Cost : ', fontSize: 20, textColor: mainColor),
                CustomText(
                  text:
                      '${BasketCubit.get(context).myBag!.data!.total!.ceil()}',
                  fontSize: 18,
                ),
                SizedBox(height: 5),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                children: [
                  CustomText(
                      text: 'Vat : ', fontSize: 20, textColor: mainColor),
                  CustomText(
                    text:
                        '${(detailsPrice.total - detailsPrice.subTotal + detailsPrice.points.ceil()).ceil()}',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomText(
                    text: 'points discount : ',
                    fontSize: 20,
                    textColor: mainColor),
                CustomText(
                  text:
                      PaymentCubit.get(context).discountTabTextIndexSelected ==
                              0
                          ? '${detailsPrice.points.ceil()}'
                          : '0',
                  fontSize: 18,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                children: [
                  CustomText(
                      text: 'Total : ', fontSize: 20, textColor: mainColor),
                  CustomText(
                    text: '${detailsPrice.total.ceil()} EGP',
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
