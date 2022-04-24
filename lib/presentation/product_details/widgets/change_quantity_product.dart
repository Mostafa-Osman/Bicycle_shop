import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ChangeQuantityProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);

    return BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: (){
                  basketCubit.productDetailsQuantity();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: mainColor,
                ),
                child: const Icon(
                  Icons.remove,
                  color: white,
                  size: 20,
                ),
              ),
            ),
            CustomText(text: basketCubit.productQuantity.toString()),
            SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  basketCubit.productDetailsQuantity(
                    isIncrement: true,
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
      },
    );
  }
}
