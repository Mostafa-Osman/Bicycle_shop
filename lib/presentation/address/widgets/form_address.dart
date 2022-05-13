import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/address/address_cubit/address_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';

class FormAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressCubit>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
      child: Form(
        key: addressCubit.formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'City',
                fontSize: 15.0,
              ),
              const SizedBox(height: 5.0),
              CustomTextFormField(
                controller: addressCubit.cityControl,
                roundedRectangleBorder: 10.0,
                textHint: 'City',
                textInputAction: TextInputAction.next,
                backgroundColor: const Color(0xfff2f2f2),
                validator: (value) =>
                    (value!.isEmpty) ? 'Please Enter Your City' : null,
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: 'Region',
                fontSize: 15.0,
              ),
              const SizedBox(height: 5.0),
              CustomTextFormField(
                controller: addressCubit.regionControl,
                textHint: 'Region',
                textInputAction: TextInputAction.next,
                roundedRectangleBorder: 10.0,
                backgroundColor: const Color(0xfff2f2f2),
                validator: (value) =>
                    (value!.isEmpty) ? 'Please Enter Your Region' : null,
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: 'Address details',
                fontSize: 15.0,
              ),
              const SizedBox(height: 5.0),
              CustomTextFormField(
                controller: addressCubit.addressDetailsControl,
                backgroundColor: const Color(0xfff2f2f2),
                roundedRectangleBorder: 10.0,
                textInputAction: TextInputAction.next,
                textHint: "Address details",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your address details';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: 'building number',
                fontSize: 15.0,
              ),
              const SizedBox(height: 5.0),
              CustomTextFormField(
                controller: addressCubit.buildingNumberControl,
                roundedRectangleBorder: 10.0,
                backgroundColor: const Color(0xfff2f2f2),
                textHint: "building number",
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) return 'building number';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: 'Notes',
                fontSize: 15.0,
              ),
              const SizedBox(height: 5.0),
              CustomTextFormField(
                controller: addressCubit.notesAddressControl,
                roundedRectangleBorder: 10.0,
                textInputAction: TextInputAction.done,
                backgroundColor: const Color(0xfff2f2f2),
                textHint: "Notes",
              )
            ],
          ),
        ),
      ),
    );
  }
}
