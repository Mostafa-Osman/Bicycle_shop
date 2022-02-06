import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';

class BuildItem extends StatelessWidget {
  final data;

  const BuildItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => navigateWithArgument(
            context, RouteConstant.productDetailsRoute, data),
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [

                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: 200.0,
                    child: Image(
                      image: NetworkImage(data.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  if (data.discount != 0)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/discount.svg',
                            fit: BoxFit.cover, height: 30, width: 30),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: data.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      height: 1.3,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'EGP ${data.price}',
                                maxLines: 2,
                                fontSize: 14,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                textColor: mainColor),
                            if (data.discount != 0)
                              CustomText(
                                  text: ' ${data.oldPrice} EGP',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  height: 1.3,
                                  textColor: grey,
                                  decoration: TextDecoration.lineThrough),
                          ],
                        ),
                        Spacer(),
                        CustomFavouriteIcon(
                            productId: data.id!, iconSize: 35.0),
                      ],
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
