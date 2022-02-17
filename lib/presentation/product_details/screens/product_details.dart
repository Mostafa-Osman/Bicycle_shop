import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/states.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/body.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/bottom_nav_bar.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic productDetails;

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
          body: ConditionalBuilder(
              condition: HomeCubit.get(context).homeModel != null,
              builder: (context) => Body(productDetails: productDetails),
              fallback: (context) => Center(
                child:
                    CustomText(text: 'Empty !', fontSize: 15, textColor: grey),
              ),
            ),

          bottomNavigationBar: BottomNavBar(productDetails: productDetails),
        );
      },
    );
  }
}
