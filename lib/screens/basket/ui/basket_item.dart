import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/screens/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/counter.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';

import 'package:udemy_flutter/shared/styles/color.dart';

class BasketItem extends StatelessWidget {
  final model;

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
                        top: 0,
                        left: 0,
                        child: SvgPicture.asset('assets/icons/discount.svg',
                              fit: BoxFit.cover, height: 30, width: 30),

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
                                      productId: model.id!),
                              textCount: model.quantity,
                              decrement: () => BasketCubit.get(context)
                                  .updateBasketOrderData(
                                      quantity: --model.quantity,
                                      productId: model.id!),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MyDialog(model: model);
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
                      onPress: () {
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
                      onPress: () {
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
