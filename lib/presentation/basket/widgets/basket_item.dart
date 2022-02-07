import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/basket/widgets/alert__dialog.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/counter.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BasketItem extends StatelessWidget {
  final model;

  BasketItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: CustomCard(
        widget: Container(
          height: 160.0,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              //display photo of product
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
              //show product data (name ,price ,favourite icon,update quantity and delete product)
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
                            productId: model.product.id!, iconSize: 30.0),
                      ],
                    ),
                    //product name
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                      child: CustomText(
                          text: model.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13.0,
                          height: 1.3,
                          fontWeight: FontWeight.bold),
                    ),
                    //increment and  decrement product quantity and delete product
                    Expanded(
                      child: Row(
                        children: [
                          CustomCounter(
                            increment: () {
                              BasketCubit.get(context).updateBasketOrderData(
                                  quantity: ++model.quantity,
                                  productId: model.id!);
                            },
                            textCount: model.quantity,
                            decrement: () {
                              BasketCubit.get(context).updateBasketOrderData(
                                  quantity: --model.quantity,
                                  productId: model.id!);
                            },
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
    );
  }
}
