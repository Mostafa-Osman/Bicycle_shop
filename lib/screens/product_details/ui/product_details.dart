import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/states.dart';
import 'package:udemy_flutter/screens/home/model/home_model.dart';
import 'package:udemy_flutter/screens/my_bag/bag_cubit/bag_cubit.dart';
import 'package:udemy_flutter/screens/product_details/ui/body.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/counter.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
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
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_sharp, color: orange),
            ),
          ),
          body: SingleChildScrollView(
            child: ConditionalBuilder(
              condition: HomeCubit.get(context).homeModel != null,
              builder: (context) => Body(productDetails: productDetails),
              fallback: (context) => Center(
                child:
                    defaultText(text: 'Empty !', fontSize: 15, textColor: grey),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                CustomCounter(
                  increment: () => HomeCubit.get(context).incrementOrder(),
                  textCount: HomeCubit.get(context).quantityOrder,
                  decrement: () => HomeCubit.get(context).decrementOrder(),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                      text: 'Add to bag',
                      onPressed: () {
                        // BagCubit.get(context).updateOrderData(
                        //     quantity: HomeCubit.get(context).quantityOrder,
                        //     cartId: productDetails.id!);
                        BagCubit.get(context)
                            .addToBagOrders(productDetails.id!);
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
