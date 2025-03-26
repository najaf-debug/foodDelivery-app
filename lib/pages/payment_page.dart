import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form key is valid
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Confirm payment"),
                content: SafeArea(
                  child: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text("Card Number: $cardNumber"),
                        Text("Expiry Date: $expiryDate"),
                        Text("Card Holder Name: $cardHolderName"),
                        Text("CVV: $cvvCode"),
                      ],
                    ),
                  ),
                ),
                actions: [
                  // cancel button
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveryProgressPage()));
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Checkout"),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          //Credit card form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey),

          Spacer(),

          MyButton(text: "Pay now", onTap: userTappedPay),

          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
