import 'package:flutter/material.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/counter.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class BottomNavBar extends StatelessWidget {
  final DetailsData productDetails;

  BottomNavBar({required this.productDetails});
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(0xFFFFF8DC),
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CustomCounter(
            increment: () => HomeCubit.get(context).incrementOrder(),
            textCount: HomeCubit.get(context).quantityProduct,
            decrement: () => HomeCubit.get(context).decrementOrder(),
          ),
          SizedBox(width: 10),
          Expanded(
            child: CustomButton(
                text: 'Add to basket',
                onPressed: () {
                  BasketCubit.get(context)
                      .addToBasketOrders(productDetails.id!);
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    BasketCubit.get(context).updateBasketOrderData(
                        productId: productDetails.id!,
                        quantity: HomeCubit.get(context).quantityProduct);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
