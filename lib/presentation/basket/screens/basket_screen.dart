import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/presentation/basket/widgets/basket_item.dart';
import 'package:udemy_flutter/presentation/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: 'My Basket',
          textColor: mainColor,
          textAlign: TextAlign.center,
          fontSize: 20.0,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait(
            [BlocProvider.of<BasketCubit>(context).getMyBasketData()],
          );
        },
        child: BlocBuilder<BasketCubit, BasketStates>(
          builder: (context, state) {
            if (state is BasketGetOrderLoading) {
              return const Center(child: CustomLoading());
            } else if (state is BasketGetOrderError) {
              return NetworkDisconnected(onPress: () {
                BlocProvider.of<BasketCubit>(context).getMyBasketData();
              },);
            } else {
              return basketCubit.myBag.data.cartItems.isEmpty
                  ? SingleChildScrollView(
                    child: EmptyScreen(
                        onPress: () {
                          BlocProvider.of<BottomNavBarCubit>(context)
                              .changeCurrentIndex(2);
                          navigatorAndFinish(
                            context,
                            RouteConstant.shopLayoutRoute,
                          );
                        },
                      ),
                  )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BasketItem(
                                index: index,
                              );
                            },
                            itemCount: basketCubit.myBag.data.cartItems.length,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 110.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    ' Total: ${basketCubit.myBag.data.total} EGP',
                                fontSize: 18.0,
                                textColor: mainColor,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomButton(
                                text: 'Pay now',
                                onPressed: () {
                                  BlocProvider.of<PaymentCubit>(context)
                                      .estimateOrdersData();
                                  navigateTo(
                                    context,
                                    RouteConstant.paymentRoute,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    );
            }
          },
        ),
      ),
    );
  }
}
