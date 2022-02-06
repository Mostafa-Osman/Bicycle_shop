import 'package:flutter/material.dart';
import 'package:udemy_flutter/presentation/orders_details/cubit/order_details_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductsOrderDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var orderDetails =OrderDetailsCubit.get(context).orderDetails;

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orderDetails!.products!.length,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 20),
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          widget: Row(
            children: [
              Image(
                image: NetworkImage(
                    orderDetails.products![index].image!),
                width: 120,
                height: 120,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                            text: 'price : ',
                            fontSize: 18,
                            textColor: mainColor),
                        CustomText(
                          text:
                          '${orderDetails.products![index].price} EGP',
                          fontSize: 16,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 5.0),
                      child: Row(
                        children: [
                          CustomText(
                              text: 'Name : ',
                              fontSize: 16,
                              textColor: mainColor),
                          Expanded(
                            child: CustomText(
                              text: orderDetails
                                  .products![index].name!,
                              maxLines: 1,
                              overflow:
                              TextOverflow.ellipsis,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Quantity : ',
                            fontSize: 20,
                            textColor: mainColor),
                        CustomText(
                          text:
                          '${orderDetails.products![index].quantity}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          height: 1.3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
