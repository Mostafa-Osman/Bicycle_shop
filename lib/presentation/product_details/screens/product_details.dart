import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/body.dart';
import 'package:udemy_flutter/presentation/product_details/widgets/bottom_nav_bar.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProductDetailsScreen extends StatelessWidget {
  final DetailsData productDetails;

  const ProductDetailsScreen({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            homeCubit.quantityProduct = 1;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
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
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CustomLoading());
          } else if (state is HomeError) {
            return const Center(
              child: Text(
                'Error',
                style: TextStyle(fontSize: 30, color: red),
              ),
            );
          } else {
            return Body(productDetails: productDetails);
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(productDetails: productDetails),
    );
  }
}
