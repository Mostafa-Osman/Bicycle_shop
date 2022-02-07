import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/states.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
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
          condition: state is GetAddressSuccess,
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
                    height: AddressCubit.get(context)
                                .addressModel!
                                .data!
                                .data!
                                .length >
                            1
                        ? 120.0
                        : 90.0,
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
                            decoration: BoxDecoration(
                                color: PaymentCubit.get(context)
                                    .backgroundTextAddress,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                    color: PaymentCubit.get(context)
                                        .backgroundTextAddress)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'City : ' +
                                          '${AddressCubit.get(context).addressModel!.data!.data![index].city}',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      textColor:
                                          PaymentCubit.get(context).textColor),

                                      CustomText(
                                          text: 'region : ' +
                                              '${AddressCubit.get(context).addressModel!.data!.data![index].region}',
                                          fontSize: 20,
                                          textColor: PaymentCubit.get(context)
                                              .textColor),
                                      CustomText(
                                          text: 'details : '
                                              '${AddressCubit.get(context).addressModel!.data!.data![index].details}',
                                          fontSize: 20,
                                          textColor: PaymentCubit.get(context)
                                              .textColor),


                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(height: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: CustomButton(
                      buttonColor: mainColor,
                      onPressed: () =>
                          navigateTo(context, RouteConstant.addAddressRoute),
                      text: 'Add new address',
                      textColor: white,
                    ),
                  ),
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
