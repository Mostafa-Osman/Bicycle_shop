import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class AddAddressScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final cityControl = TextEditingController();
  final addressDetailsControl = TextEditingController();
  final regionControl = TextEditingController();
  final addressNameControl = TextEditingController();
  final notesAddressControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addressCubit=  BlocProvider.of<AddressCubit>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const CustomText(text: 'new address', textColor: mainColor),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: BlocConsumer<AddressCubit, AddressStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: SizedBox(
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
                                backgroundColor: const Color(0xfff2f2f2),
                                validator: (value) => (value!.isEmpty)
                                    ? 'Please Enter Your City'
                                    : null,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: CustomTextFormField(
                                  controller: regionControl,
                                  textHint: 'Region',
                                  backgroundColor: const Color(0xfff2f2f2),
                                  validator: (value) => (value!.isEmpty)
                                      ? 'Please Enter Your Region'
                                      : null,
                                ),
                              ),

                              CustomTextFormField(
                                controller: addressDetailsControl,
                                backgroundColor: const Color(0xfff2f2f2),
                                textHint: "Address details",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Your add&update_address details';
                                  }
                                  return null;
                                },
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0,),
                                child: CustomTextFormField(
                                  controller: addressNameControl,
                                  backgroundColor: const Color(0xfff2f2f2),
                                  textHint: "Address name",
                                  validator: (value) {
                                    if (value!.isEmpty) return 'Address name';
                                    return null;
                                  },
                                ),
                              ),

                              CustomTextFormField(
                                controller: notesAddressControl,
                                backgroundColor: const Color(0xfff2f2f2),
                                textHint: "Notes about Address",
                              ),

                              const SizedBox(height: 30),
                              // button to submit register
                              CustomButton(
                                text: 'Save new address',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    addressCubit.addNewAddressData(
                                        city: cityControl.text,
                                        region: regionControl.text,
                                        details: addressDetailsControl.text,
                                        name: addressNameControl.text,
                                        notes: notesAddressControl.text,);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],),
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
