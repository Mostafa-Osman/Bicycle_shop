import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';

class UpdateAddressScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final index;

  UpdateAddressScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: CustomText(text: 'Edit address', textColor: mainColor),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: BlocConsumer<AddressCubit, AddressStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit =
              AddressCubit.get(context).addressModel!.data!.data![index];
          final cityControl = TextEditingController(text: cubit.city);
          final addressDetailsControl =
              TextEditingController(text: cubit.details);
          final regionControl = TextEditingController(text: cubit.region);
          final addressNameControl = TextEditingController(text: cubit.name);
          final notesAddressControl = TextEditingController(text: cubit.notes);
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                controller: cityControl,
                                textHint: 'City',
                                hintColor: grey,
                                backgroundColor: Color(0xfff2f2f2),
                                validator: (value) => (value!.isEmpty)
                                    ? 'Please Enter Your City'
                                    : null,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: CustomTextFormField(
                                  controller: regionControl,
                                  textHint: 'Region',
                                  hintColor: grey,
                                  backgroundColor: Color(0xfff2f2f2),
                                  validator: (value) => (value!.isEmpty)
                                      ? 'Please Enter Your Region'
                                      : null,
                                ),
                              ),

                              CustomTextFormField(
                                controller: addressDetailsControl,
                                backgroundColor: Color(0xfff2f2f2),
                                textHint: "Address details",
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Please Enter Your add&update_address details';
                                  return null;
                                },
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: CustomTextFormField(
                                  controller: addressNameControl,
                                  backgroundColor: Color(0xfff2f2f2),
                                  textHint: "Address name",
                                  validator: (value) {
                                    if (value!.isEmpty) return 'Address name';
                                    return null;
                                  },
                                ),
                              ),

                              CustomTextFormField(
                                controller: notesAddressControl,
                                backgroundColor: Color(0xfff2f2f2),
                                textHint: "Notes about Address",
                              ),

                              SizedBox(height: 30),
                              // button to submit register
                              CustomButton(
                                text: 'Update address',
                                buttonColor: mainColor,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    AddressCubit.get(context).updateAddressData(
                                        addressId: cubit.id,
                                        city: cityControl.text,
                                        region: regionControl.text,
                                        details: addressDetailsControl.text,
                                        name: addressNameControl.text,
                                        notes: notesAddressControl.text);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              // button to submit register
                              CustomButton(
                                text: 'Delete address',
                                buttonColor: mainColor,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    AddressCubit.get(context)
                                        .deleteAddressData(addressId: cubit.id);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
