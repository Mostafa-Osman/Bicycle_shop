import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class MyAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'My address',
          textColor: mainColor,
          textAlign: TextAlign.center,
          fontSize: 20.0,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: BlocConsumer<AddressCubit, AddressStates>(
        listener: (context, state) {
          if (state is DeleteAddressOrderSuccess) {
            showToast(
              state: ToastStates.success,
              message: 'address deleted successfully',
            );
          } else if (state is DeleteAddressError) {
            showToast(
              state: ToastStates.error,
              message: 'something wrong please try again later',
            );
          }
        },
        builder: (context, state) {
          if (state is GetAddressLoading) {
            return const Center(child: CustomLoading());
          } else {
            if (state is GetAddressError) {
              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(fontSize: 30, color: red),
                ),
              );
            } else {
              if (addressCubit.addressModel.data.isEmpty) {
                return EmptyScreen(
                  buttonText: 'Add new address',
                  onPress: () {
                    addressCubit.clearTextFromField();
                    navigateTo(context, RouteConstant.addAddressRoute);
                  },
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          itemCount: addressCubit.addressModel.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    text:
                                        '${index + 1} - City : ${addressCubit.addressModel.data[index].city}',
                                    fontSize: 18,
                                    textColor: black,
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Color(0XFF5AA0E0),
                                      size: 25.0,
                                    ),
                                    onPressed: () {
                                      addressCubit.initialTextFromField(
                                        city: addressCubit
                                            .addressModel.data[index].city,
                                        addressDetails: addressCubit
                                            .addressModel.data[index].details,
                                        region: addressCubit
                                            .addressModel.data[index].region,
                                        buildingNumber: addressCubit
                                            .addressModel
                                            .data[index]
                                            .buildingNumber,
                                        notes: addressCubit
                                            .addressModel.data[index].notes,
                                      );
                                      navigateWithArgument(
                                        context,
                                        RouteConstant.updateAddressRoute,
                                        index,
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 5.0),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: mainColor,
                                      size: 25.0,
                                    ),
                                    onPressed: () {
                                      addressCubit.deleteAddressData(
                                        addressId: addressCubit
                                            .addressModel.data[index].id,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, _) =>
                              const CustomDotedLine(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomButton(
                        text: 'Add new address',
                        onPressed: () {
                          addressCubit.clearTextFromField();
                          navigateTo(context, RouteConstant.addAddressRoute);
                        },
                      ),
                    ),
                  ],
                );
              }
            }
          }
        },
      ),
    );
  }
}
