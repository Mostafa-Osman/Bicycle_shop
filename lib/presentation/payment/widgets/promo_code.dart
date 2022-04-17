import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/presentation/payment/widgets/card_item.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';

class PromoCode extends StatelessWidget {
  final _promoCodeKey = GlobalKey<FormState>();
  final promoCodeControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            CardItem(
                title: "Do you want to use discount voucher?",
                labels: paymentCubit.labelText,
                selectedIndex: paymentCubit.voucherTabTextIndexSelected,
                selectedLabelIndex: (int index) {
                  paymentCubit.changeVoucher(index);
                },),
            // if (cubit.voucherTabTextIndexSelected == 0)
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
             child:   Column(
                    children: [
                      Form(
                        key: _promoCodeKey,
                        child: CustomTextFormField(
                            controller: promoCodeControl,
                            roundedRectangleBorder: 10.0,
                            textHint: 'Enter promo code',
                            validator: (value) {
                              if (value!.isEmpty) {
                                showToast(
                                    message: 'Please Enter promo code',
                                    state: ToastStates.warning,);
                              }
                              return null;
                            },),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: CustomButton(
                          onPressed: () {
                            paymentCubit
                                .promoCode(code:promoCodeControl.toString());
                            if (_promoCodeKey.currentState!.validate() &&
                                state is PromoCodeSuccess) {
                              paymentCubit.estimateOrdersData(
                                );
                            }
                          },
                          text: 'Check',
                        ),
                      )
                    ],
                  ),

              ),
          ],
        );
      },
    );
  }
}
