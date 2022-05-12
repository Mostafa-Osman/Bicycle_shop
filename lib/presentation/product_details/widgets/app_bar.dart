import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/product_details_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);

    return   Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              BlocProvider.of<ProductDetailsCubit>(context)
                  .changeShowBasketIcon(isShow: true);
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                color: Colors.white30,
              ),
              child: const Icon(
                Icons.arrow_back_ios_sharp,
                color: mainColor,
              ),
            ),
          ),
          const Spacer(),
          if (productDetailsCubit.isShowBasketIcon)
            InkWell(
              onTap: () {
                navigateTo(context, RouteConstant.basketRoute);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: Colors.white30,
                ),
                child: Center(
                  child: Container(
                    width: 25,
                    height: 25,
                    padding: const EdgeInsets.only(top: 1.2),
                    child: SvgPicture.asset(
                      'assets/icons/basket.svg',
                      fit: BoxFit.fitWidth,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
