import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ChangeQuantityProduct extends StatelessWidget {
  final int index;

  const ChangeQuantityProduct({required this.index});

  @override
  Widget build(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);
    final model = basketCubit.myBag.data.cartItems[index];
    return Row(
      children: [
        SizedBox(
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {
              basketCubit.quantityItem(
                isIncrement: false,
                index: index,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: mainColor,
            ),
            child: const Icon(
              Icons.remove,
              color: white,
              size: 25,
            ),
          ),
        ),
        CustomText(text: model.quantity.toString()),
        SizedBox(
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {
              basketCubit.quantityItem(
                isIncrement: true,
                index: index,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: mainColor,
            ),
            child: const Icon(
              Icons.add,
              color: white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
