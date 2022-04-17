import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:udemy_flutter/presentation/payment/payment_cubit/payment_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class CreditCard extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);

    return CustomCard(
      widget: SizedBox(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: paymentCubit.cardNumber,
              expiryDate: paymentCubit.expiryDate,
              cardHolderName: paymentCubit.cardHolderName,
              cvvCode: paymentCubit.cvvCode,
              showBackView: paymentCubit.isCvvFocused,
              onCreditCardWidgetChange: (_) => paymentCubit.onCreditCardModelChange,
            ),
            CreditCardForm(
              formKey: _formKey,
              // Required
              onCreditCardModelChange: (CreditCardModel data) {
                paymentCubit.onCreditCardModelChange(data);
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
              cardNumber: paymentCubit.cardNumber,
              cvvCode: paymentCubit.cvvCode,
              cardHolderName: paymentCubit.cardHolderName,
              expiryDate: paymentCubit.expiryDate,
            ),
            const  SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
