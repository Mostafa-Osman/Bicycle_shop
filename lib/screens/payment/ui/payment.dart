import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/states.dart';
import 'package:udemy_flutter/screens/payment/ui/widgets/address.dart';
import 'package:udemy_flutter/screens/payment/ui/widgets/bottom_nav.dart';
import 'package:udemy_flutter/screens/payment/ui/widgets/card_item.dart';
import 'package:udemy_flutter/screens/payment/ui/widgets/credit_card.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentScreen extends StatelessWidget {
  final checkBoxController = GroupController();
  final addressControl = TextEditingController();
  final promoCodeControl = TextEditingController();
  final _promoCodeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: CustomText(text: 'Payment', textColor: mainColor),
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                child: Column(
                  children: [
                    //select pay
                    CustomCard(
                      widget: SizedBox(
                        height: 170,
                        child: SimpleGroupedCheckbox(
                          checkFirstElement: true,
                          controller: checkBoxController,
                          itemsSubTitle: [
                            'The delivery staff goes to your door,you give the money according to the value of the application and delivery fees for employees',
                            'We will call you back to confirm the order,After confirmation,we will proceed to pick up,pack,issue bills and will notify the actual bill for you to transfer'
                          ],
                          onItemSelected: (_) => cubit.isOnlinePayment(),
                          itemsTitle: ["cash", "Online"],
                          values: ["cash", "Online"],
                          groupStyle: GroupStyle(
                              activeColor: Colors.blue,
                              itemTitleStyle: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                    ),
                    if (cubit.isOnline)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: CreditCard(),
                      ),
                    CardItem(
                      title: "Do you want to use discount points?",
                      labels: cubit.labelText,
                      selectedIndex: cubit.discountTabTextIndexSelected,
                      selectedLabelIndex: (index) =>
                          cubit.changeDiscount(index),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: CardItem(
                          title: "Do you want to use discount voucher?",
                          labels: cubit.labelText,
                          selectedIndex: cubit.voucherTabTextIndexSelected,
                          selectedLabelIndex: (index) {
                            return cubit.changeVoucher(index);
                          }),
                    ),
                    if (cubit.voucherTabTextIndexSelected == 0)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50.0,
                                  child: CustomTextFormField(
                                      key: _promoCodeKey,
                                      controller: promoCodeControl,
                                      roundedRectangleBorder: 10.0,
                                      textHint: 'Enter promo code',
                                      validator: (value) => (value!.isEmpty)
                                          ? 'Please Enter promo code'
                                          : null),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.only(
                                    //   topLeft: Radius.circular(10.0),
                                    //   bottomLeft: Radius.circular(10.0),
                                    //   bottomRight: Radius.circular(10.0),
                                    // ),
                                    color: Colors.green,
                                  ),
                                  child: CustomTextButton(
                                    textColor: white,
                                    onPressed: () {
                                      if (_promoCodeKey.currentState!
                                          .validate()) print(1);
                                    },
                                    text: 'Check',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // address
                    SizedBox(height: 20.0),
                    AddressPayment()
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}
