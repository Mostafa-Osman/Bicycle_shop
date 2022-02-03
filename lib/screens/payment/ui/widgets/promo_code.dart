import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/states.dart';
import 'package:udemy_flutter/screens/payment/ui/widgets/card_item.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PromoCode extends StatelessWidget {
  final _promoCodeKey = GlobalKey<FormState>();
  final promoCodeControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = PaymentCubit.get(context);

    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            CardItem(
                title: "Do you want to use discount voucher?",
                labels: cubit.labelText,
                selectedIndex: cubit.voucherTabTextIndexSelected,
                selectedLabelIndex: (index) {
                  cubit.changeVoucher(index);
                }),
            if (cubit.voucherTabTextIndexSelected == 0)
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child:
                        Form(
                          key: _promoCodeKey,
                          child:
                          CustomTextFormField(
                              controller: promoCodeControl,
                              roundedRectangleBorder: 10.0,
                              textHint: 'Enter promo code',
                              validator: (value) {
                                if (value!.isEmpty)
                                  showToast(
                                      message: 'Please Enter promo code',
                                      state: ToastStates.WARNING);
                              }),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            color: Colors.green,
                          ),
                          child: CustomTextButton(
                            textColor: white,
                            onPressed: () {
                              PaymentCubit.get(context)
                                  .promoCode(promoCodeControl);
                              if (_promoCodeKey.currentState!.validate() &&
                                  state is PromoCodeSuccess) {
                                cubit.estimateOrdersData(
                                    cubit.discountTabTextIndexSelected == 0
                                        ? true
                                        : false,
                                    cubit.voucherTabTextIndexSelected == 0
                                        ? promoCodeControl
                                        : null);
                              }
                            },
                            text: 'Check',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
