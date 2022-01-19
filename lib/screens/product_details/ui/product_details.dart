import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/states.dart';
import 'package:udemy_flutter/screens/home/model/home_model.dart';
import 'package:udemy_flutter/screens/my_basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/screens/product_details/ui/body.dart';
import 'package:udemy_flutter/shared/components/counter.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsScreen extends StatelessWidget {
  final DetailsData productDetails;

  ProductDetailsScreen({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                HomeCubit.get(context).quantityProduct = 1;
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
            ),
            actions: [
              IconButton(
                onPressed: () => navigateTo(context, RouteConstant.basketRoute),
                icon: SvgPicture.asset(
                  'assets/icons/basket.svg',
                  fit: BoxFit.fitWidth,
                  color: mainColor,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: ConditionalBuilder(
              condition: HomeCubit.get(context).homeModel != null,
              builder: (context) => Body(productDetails: productDetails),
              fallback: (context) => Center(
                child:
                    CustomText(text: 'Empty !', fontSize: 15, textColor: grey),
              ),
            ),
          ),
          bottomNavigationBar: Container(
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
                      text: 'Add to bag',
                      onPressed: () {
                        BasketCubit.get(context)
                            .addToBasketOrders(productDetails.id!);
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
