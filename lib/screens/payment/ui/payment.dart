import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/basket/basket_cubit/basket_cubit.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/states.dart';
import 'package:udemy_flutter/screens/payment/ui/card_item.dart';
import 'package:udemy_flutter/screens/payment/ui/credit_card.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_button.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/custom_text_form_field.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class PaymentScreen extends StatelessWidget {
  final controller = GroupController();
  final addressControl = TextEditingController();
  final _key = GlobalKey<FormState>();

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
                onPressed: () {
                  Navigator.pop(context);
                },
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
                          controller: controller,
                          itemsSubTitle: [
                            'The delivery staff goes to your door,you give the money according to the value of the application and delivery fees for employees',
                            'We will call you back to confirm the order,After confirmation,we will proceed to pick up,pack,issue bills and will notify the actual bill for you to transfer'
                          ],
                          onItemSelected: (_) => cubit.isOnlinePayment(),
                          itemsTitle: ["cash", "Online"],
                          values: ["cash", "Online"],
                          groupStyle: GroupStyle(
                              activeColor: red,
                              itemTitleStyle: TextStyle(fontSize: 18)),
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
                    CustomCard(
                      widget: SizedBox(
                        height: 120,
                        child: Column(
                          children: [
                            CustomText(
                                text: 'Write your address please',
                                fontSize: 18),
                            SizedBox(height: 10),
                            Form(
                              key: _key,
                              child: CustomTextFormField(
                                  controller: addressControl,
                                  textHint: 'Add new address',
                                  hintColor: grey,
                                  roundedRectangleBorder: 15.0,
                                  validator: (value) => value!.isEmpty
                                      ? 'please Enter your address'
                                      : null),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(right: 10.0, left: 15.0, top: 10),
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text:
                        ' Total: ${BasketCubit.get(context).myBag!.data!.total} EGP',
                    fontSize: 18.0,
                    textColor: mainColor,
                    // backgroundColor: Colors.orangeAccent[100],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomButton(
                    text: 'Complete orders now',
                    onPressed: () {
                      if (_key.currentState!.validate())
                        PaymentCubit.get(context).makeOrderData(
                          BasketCubit.get(context)
                              .myBag!
                              .data!
                              .cartItems[0]
                              .product!
                              .id,
                          //points you must change it
                          100,
                          PaymentCubit.get(context).isOnline ? 0 : 1,
                          PaymentCubit.get(context)
                                      .discountTabTextIndexSelected ==
                                  1
                              ? true
                              : 0.0,
                          PaymentCubit.get(context)
                                      .voucherTabTextIndexSelected ==
                                  1
                              ? true
                              : false,
                        );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
