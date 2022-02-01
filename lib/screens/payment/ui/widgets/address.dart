import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/screens/address/address_cubit/states.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class AddressPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AddressCubit.get(context).addressModel != null,
          builder: (context) => Padding(
            padding:
                const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
            child: CustomCard(
              widget: Column(
                children: [
                  CustomText(
                    text: 'My Addresses' +
                        ' (${AddressCubit.get(context).addressModel!.data!.data!.length})',
                    textColor: mainColor,
                    fontSize: 20.0,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 120.0,
                    child: ListView.separated(
                      itemCount: AddressCubit.get(context)
                          .addressModel!
                          .data!
                          .data!
                          .length,
                      itemBuilder: (context, index) {
                        // to make style of button address
                        PaymentCubit.get(context).addressStyle(index);
                        return InkWell(
                          onTap: () => PaymentCubit.get(context)
                              .changeAddressIndex(index),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: PaymentCubit.get(context)
                                    .backgroundTextAddress,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                    color: PaymentCubit.get(context)
                                        .backgroundTextAddress)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 14.0, left: 10.0),
                              child: Text(
                                'City : ' +
                                    '${AddressCubit.get(context).addressModel!.data!.data![index].city}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: PaymentCubit.get(context).textColor),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(height: 10.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    buttonColor: lightMainColor,
                    onPressed: () =>
                        navigateTo(context, RouteConstant.addAddressRoute),
                    text: 'Add new address',
                    textColor: black,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CustomLoading()),
        );
      },
    );
  }
}
