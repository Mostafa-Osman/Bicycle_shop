import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_model.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class MyDialog extends StatelessWidget {
  final Cart model;

  const MyDialog({required this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: CustomText(
                text: 'Are You Sure ?',
                fontSize: 20.0,
                textColor: red,
              ),
            ),
            const Center(
              child: CustomDivider(
                thickness: 1,
                color: lightMainColor,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextButton(
                        onPressed: () {
                          final basketCubit = BlocProvider.of<BasketCubit>(context);

                          basketCubit
                              .deleteOrderFromBasketData(productId: model.id);
                          basketCubit.getMyBasketData();
                          Navigator.of(context).pop();
                        },
                        text: 'Delete',
                        fontSize: 20,
                        textColor: mainColor,
                      ),
                    ),
                    const SizedBox(
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
