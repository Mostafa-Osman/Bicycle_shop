
import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class MyDialog extends StatelessWidget {
  final model;

  const MyDialog({required this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: CustomText(
                text: 'Are You Sure ?',
                fontSize: 20.0,
                textColor: red,
              ),
            ),
            Center(
              child: CustomDivider(
                thickness: 1,
                color: lightMainColor,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Row(children: [
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        BasketCubit.get(context)
                            .deleteOrderFromBasketData(productId: model.id);
                        BasketCubit.get(context).getMyBasketData();
                        Navigator.of(context).pop();
                      },
                      text: 'Delete',
                      fontSize: 20,
                      textColor: mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Cancel',
                      fontSize: 20,
                      textColor: mainColor,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}