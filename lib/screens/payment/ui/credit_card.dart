import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:udemy_flutter/screens/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CreditCard extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  @override
  Widget build(BuildContext context) {
    var cubit = PaymentCubit.get(context);
    return CustomCard(
      widget: SizedBox(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cubit.cardNumber,
              expiryDate: cubit.expiryDate,
              cardHolderName: cubit.cardHolderName,
              cvvCode: cubit.cvvCode,
              showBackView: cubit.isCvvFocused,
              onCreditCardWidgetChange: (_) => cubit.onCreditCardModelChange,
            ),
            CreditCardForm(
              formKey: _formKey,
              // Required
              onCreditCardModelChange: (CreditCardModel data) {
                cubit.onCreditCardModelChange(data);
              },
              // Required
              themeColor: red,
              cardNumberDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder',
              ),
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate:expiryDate,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
