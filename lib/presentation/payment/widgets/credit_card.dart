import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CreditCard extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
              cardNumber: cubit.cardNumber,
              cvvCode: cubit.cvvCode,
              cardHolderName: cubit.cardHolderName,
              expiryDate: cubit.expiryDate,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
