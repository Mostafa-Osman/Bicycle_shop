import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/my_basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/screens/my_basket/basket_cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/counter.dart';

import 'package:udemy_flutter/shared/styles/color.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketStates>(
        builder: (context, state) {
          //  print(lastPageIndex);
          return Scaffold(
            body: (state is AddToBasketLoadingState ||
                    state is BasketInitialState ||
                    // state is BasketUpdateQuantityLoadingState ||
                    state is AddToBasketErrorState ||
                    state is ShopGetOrderLoadingState
                //|| state is BasketUpdateQuantityErrorState
                )
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => BasketItem(
                                    model: BasketCubit.get(context)
                                        .myBag!
                                        .data!
                                        .cartItems[index],
                                  ),
                              itemCount: BasketCubit.get(context)
                                  .myBag!
                                  .data!
                                  .cartItems
                                  .length),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  ' Total: ${BasketCubit.get(context).myBag!.data!.total} EGP',
                              fontSize: 18.0,
                              textColor: mainColor,
                              // backgroundColor: Colors.orangeAccent[100],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomButton(
                              text: 'Complete orders now',
                              onPressed: () => navigateTo(
                                  context, RouteConstant.paymentRoute),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
        listener: (context, state) {});
  }
}

class BasketItem extends StatelessWidget {
  final model;
  int count = 1;

  BasketItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {},
        child: CustomCard(
          widget: Container(
            height: 160.0,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(model.product.image),
                      width: 120,
                      height: 120,
                    ),
                    if (model.product.discount != 0)
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/icons/discount.png",
                          fit: BoxFit.cover,
                        ),
                        width: 30.0,
                      ),
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: 'EGP ${model.product.price.toString()}',
                              fontSize: 15.0,
                              height: 1.0,
                              fontWeight: FontWeight.bold,
                              textColor: mainColor),
                          SizedBox(
                            width: 5.0,
                          ),
                          if (model.product.discount != 0)
                            CustomText(
                                text:
                                    'EGP ${model.product.oldPrice.toInt().toString()}',
                                fontSize: 13.0,
                                height: 1.0,
                                textColor: grey,
                                decoration: TextDecoration.lineThrough),
                          Spacer(),
                          CustomFavouriteIcon(
                              onPressed: () => FavouriteCubit.get(context)
                                  .changeFavorites(model.product.id!, context),
                              checkFavourite: HomeCubit.get(context)
                                  .favourites[model.product.id])
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomText(
                          text: model.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13.0,
                          height: 1.3,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            CustomCounter(
                              increment: () => BasketCubit.get(context)
                                  .updateBasketOrderData(
                                      quantity: ++model.quantity,
                                      cartId: model.id!),
                              textCount: model.quantity,
                              decrement: () => BasketCubit.get(context)
                                  .updateBasketOrderData(
                                      quantity: ++model.quantity,
                                      cartId: model.id!),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.grey[200],
                                      insetPadding:
                                          EdgeInsets.symmetric(vertical: 50),
                                      title:
                                          CustomText(text: 'Delete my_basket'),
                                      content: Container(
                                        height: 90.0,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            CustomText(
                                                text: 'Are You Sure ?',
                                                fontSize: 20.0),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(children: [
                                              Expanded(
                                                child: CustomButton(
                                                  onPressed: () {
                                                    BasketCubit.get(context)
                                                        .deleteOrderFromBasketData(
                                                            cartId: model.id);
                                                    BasketCubit.get(context)
                                                        .getMyBasketData();
                                                    Navigator.of(context).pop();
                                                  },
                                                  text: 'Delete',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Expanded(
                                                child: CustomButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  text: 'Cancel',
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
