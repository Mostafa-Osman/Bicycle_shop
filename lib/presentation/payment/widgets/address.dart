import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/toast.dart';
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
          return InkWell(
            onTap: () {
              BlocProvider.of<AddressCubit>(context).getMyAddressData();
            },
            child: Container(
              width: 60,
              height: 60,
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
                Icons.refresh,
                color: mainColor,
              ),
            ),
          );
        } else {
          return addressCubit.addressModel.data.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                    right: 5.0,
                    left: 5.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: CustomButton(
                    onPressed: () =>
                        navigateTo(context, RouteConstant.addAddressRoute),
                    text: 'Add new address',
                  ),
                )
              : CustomCard(
                  widget: Column(
                    children: [
                      CustomText(
                        text: 'My Addresses' +
                            ' (${addressCubit.addressModel.data.length})',
                        textColor: mainColor,
                        fontSize: 15.0,
                        height: 2.0,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: addressCubit.addressModel.data.length > 1
                            ? 200.0
                            : 90.0,
                        child: ListView.separated(
                          itemCount: addressCubit.addressModel.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () =>
                                  paymentCubit.changeAddressIndex(index),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xffE0E0E0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      if (paymentCubit.addressIndex == index)
                                        Positioned(
                                          top: 20.0,
                                          right: 0.0,
                                          child: SvgPicture.asset(
                                            'assets/icons/done.svg',
                                          ),
                                        ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text:
                                                'City : ${addressCubit.addressModel.data[index].city}',
                                            fontSize: 15,
                                            height: 1.4,
                                            fontWeight: FontWeight.w600,
                                            textColor: black,
                                          ),
                                          CustomText(
                                            text:
                                                'region : ${addressCubit.addressModel.data[index].region}',
                                            fontSize: 15,
                                            height: 1.4,
                                            fontWeight: FontWeight.w600,
                                            textColor: black,
                                          ),
                                          CustomText(
                                            text: 'details : '
                                                '${addressCubit.addressModel.data[index].details}',
                                            fontSize: 15,
                                            height: 1.4,
                                            fontWeight: FontWeight.w600,
                                            textColor: black,
                                          ),
                                        ],
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
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: CustomButton(
                          onPressed: () => navigateTo(
                            context,
                            RouteConstant.addAddressRoute,
                          ),
                          text: 'Add new address',
                        ),
                      ),
                    ],
                  ),
                );
        }
      },
    );
  }
}
