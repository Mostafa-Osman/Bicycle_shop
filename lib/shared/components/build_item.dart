import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/data/models/favourite_model/favourites_model.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_favourite_icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BuildItem extends StatelessWidget {
  final DataDetails model;

  const BuildItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10),
      child: CustomCard(
        widget: SizedBox(
          height: MediaQuery.of(context).size.height/8.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SizedBox(width: 7.0),
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: 120,
                    height: 80,
                  ),
                  if (model.discount != 0)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset('assets/icons/discount.svg',
                          fit: BoxFit.cover, height: 30, width: 30,),
                    ),
                ],
              ),
              const  SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, right: 10, left: 5.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: model.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                      const   Spacer(),
                      Row(
                        children: [
                          CustomText(
                            text: 'EGP ${model.price.toString()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 15,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                            textColor: mainColor,
                          ),
                          const  Spacer(),
                          CustomFavouriteIcon(productId: model.id),
                        ],
                      ),
                      if (model.discount != 0)
                        CustomText(
                            text: 'EGP ${model.oldPrice.toString()}',
                            fontSize: 13,
                            textColor: grey,
                            decoration: TextDecoration.lineThrough,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
