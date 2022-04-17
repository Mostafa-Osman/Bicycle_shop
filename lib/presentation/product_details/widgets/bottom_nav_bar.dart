import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/counter.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class BottomNavBar extends StatelessWidget {
  final DetailsData productDetails;

  const BottomNavBar({required this.productDetails});
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final basketCubit = BlocProvider.of<BasketCubit>(context);

    return  Container(
      color: const Color(0xFFFFF8DC),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CustomCounter(
            increment: () => homeCubit.incrementOrder(),
            textCount: homeCubit.quantityProduct.toString(),
            decrement: () =>homeCubit.decrementOrder(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButton(
                text: 'Add to basket',
                onPressed: () {
                  basketCubit
                      .addToBasketOrders(productDetails.id);
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    basketCubit.updateBasketOrderData(
                        productId: productDetails.id,
                        quantity: homeCubit.quantityProduct,);
                  });
                },),
          ),
        ],
      ),
    );
  }
}
