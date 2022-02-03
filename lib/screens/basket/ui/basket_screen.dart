import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/screens/basket/basket_cubit/states.dart';
import 'package:udemy_flutter/screens/basket/ui/basket_item.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: CustomText(
              text: 'My Basket',
              textColor: mainColor,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
            ),
          ),
          body: ConditionalBuilder(
            condition: (
                //BasketCubit.get(context).myBag != null
                state is ShopGetOrderSuccessState),
            builder: (context) {
              var cubit = BasketCubit.get(context).myBag!.data!;
              return BasketCubit.get(context).myBag!.data!.cartItems.isEmpty
                  ? EmptyScreen()
                  : Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => BasketItem(
                                      model: cubit.cartItems[index],
                                    ),
                                itemCount: cubit.cartItems.length),
                          ),
                        ),
                      ],
                    );
            },
            fallback: (context) => Center(
                child:CustomLoading()
            ),
          ),
          bottomNavigationBar: BasketCubit.get(context).myBag != null &&
                  BasketCubit.get(context).myBag!.data!.cartItems.isNotEmpty
              ? Container(
                  padding: EdgeInsets.all(10),
                  height: 110.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            ' Total: ${BasketCubit.get(context).myBag!.data!.total} EGP',
                        fontSize: 18.0,
                        textColor: mainColor,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomButton(
                        text: 'Pay now',
                        onPressed: () {
                          PaymentCubit.get(context).estimateOrdersData(false,null);
                          navigateTo(context, RouteConstant.paymentRoute);
                        },
                      )
                    ],
                  ),
                )
              : null,
        );
      },
    );
  }
}
