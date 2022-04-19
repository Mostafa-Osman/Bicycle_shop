import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AddressPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressCubit>(context);
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return BlocConsumer<AddressCubit, AddressStates>(
      listener: (context, state) {
        if (state is AddAddressSuccess) {
          showToast(
            state: ToastStates.success,
            message: 'address added successfully',
          );
        }
      },
      builder: (context, state) {
        if (state is GetAddressLoading) {
          return const Center(child: CustomLoading());
        } else if (state is GetAddressError) {
          return const Center(child: Text('Error'));
        } else {
          return Padding(
            padding:
                const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
            child: CustomCard(
              widget: Column(
                children: [
                  CustomText(
                    text: 'My Addresses' +
                        ' (${addressCubit.addressModel.data.length})',
                    textColor: mainColor,
                    fontSize: 20.0,
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: addressCubit.addressModel.data.length > 1
                        ? 120.0
                        : 90.0,
                    child: ListView.separated(
                      itemCount: addressCubit.addressModel.data.length,
                      itemBuilder: (context, index) {
                        // to make style of button address
                        paymentCubit.addressStyle(index);
                        return InkWell(
                          onTap: () => paymentCubit.changeAddressIndex(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: paymentCubit.backgroundTextAddress,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              border: Border.all(
                                color: paymentCubit.backgroundTextAddress,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        'City : ${addressCubit.addressModel.data[index].city}',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    textColor: paymentCubit.textColor,
                                  ),
                                  CustomText(
                                    text:
                                        'region : ${addressCubit.addressModel.data[index].region}',
                                    fontSize: 20,
                                    textColor: paymentCubit.textColor,
                                  ),
                                  CustomText(
                                    text: 'details : '
                                        '${addressCubit.addressModel.data[index].details}',
                                    fontSize: 20,
                                    textColor: paymentCubit.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, _) =>
                          const SizedBox(height: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: CustomButton(
                      onPressed: () =>
                          navigateTo(context, RouteConstant.addAddressRoute),
                      text: 'Add new address',
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
