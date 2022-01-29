import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/screens/address/address_cubit/states.dart';
import 'package:udemy_flutter/screens/address/address_cubit/test_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userData = ProfileCubit.get(context).userData!.data;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
        title: CustomText(
          text: 'Profile',
          textColor: mainColor,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 28,
            icon: Icon(
              Icons.settings_rounded,
              color: mainColor,
            ),
            onPressed: () {
              navigateTo(context, RouteConstant.updateProfileRoute);
            },
          ),
        ],
      ),
      body: BlocConsumer<AddressCubit, AddressStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
              condition: (state
                      is GetAddressSuccess //AddressCubit.get(context).addressModel != null
                  ),
              builder: (BuildContext context) => SingleChildScrollView(
                child: Align(
                  child: Container(
                    width: 500,
                    color: white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 30),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: black,
                                      width: 1.3,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: ClipOval(
                                        child: Image.network(
                                      userData!.image!,
                                      height: 180,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, bottom: 30.0),
                                  child: CustomText(
                                      text: userData.name!,
                                      overflow: TextOverflow.clip),
                                ),
                                AccountTextFormField(
                                  text: userData.phone!,
                                  icon: Icons.phone,
                                ),
                                AccountTextFormField(
                                  text: userData.email!,
                                  icon: Icons.email,
                                ),
                                SizedBox(height: 20.0),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 10.0),
                                  child: CustomCard(
                                    widget: Column(
                                      children: [
                                        CustomText(
                                          text: 'My Addresses' +
                                              ' (${AddressCubit.get(context).addressModel!.data!.data!.length})',
                                          textColor: Colors.grey,
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
                                            itemBuilder: (context, index) =>
                                                TextFormField(
                                              readOnly: true,
                                              onTap: () => navigateWithArgument(
                                                  context,
                                                  RouteConstant
                                                      .updateAddressRoute,
                                                  index),
                                              decoration: InputDecoration(
                                                fillColor: Colors.grey[100],
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                hintText: 'City : ' +
                                                    '${AddressCubit.get(context).addressModel!.data!.data![index].city}',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            separatorBuilder: (context, _) =>
                                                SizedBox(height: 10.0),
                                          ),
                                        ),
                                        SizedBox(height: 20.0),
                                        CustomButton(
                                          onPressed: () => navigateTo(context,
                                              RouteConstant.addAddressRoute),
                                          text: 'Add new address',
                                        ),
                                        SizedBox(height: 20.0),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              fallback: (BuildContext context) {
                return Center(child: CustomLoading());
              },
            );
          }),
    );
  }
}

class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: lightMainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          shape: BoxShape.rectangle,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(icon, color: mainColor),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: CustomText(
                    text: text,
                    fontSize: size.width >= 500 ? 18 : size.width / 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
