import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/payment/payment_type_card.dart';

class PaymentTypeView extends StatefulWidget {
  final List<dynamic> paymentOptions;
  PaymentTypeView(this.paymentOptions);
  @override
  State<StatefulWidget> createState() => PaymentTypeViewState();
}

class PaymentTypeViewState extends State<PaymentTypeView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: () {
      var cards = new List<Widget>();
      widget.paymentOptions.asMap().forEach((index, value) =>
      {
          cards.add(PaymentTypeCard(
          paymentName: widget.paymentOptions[index]["paymentName"],
          paymentIconUrl: widget.paymentOptions[index]["paymentIconUrl"],
          discountText: widget.paymentOptions[index]["discountText"],
          paymentSelected: widget.paymentOptions[index]["selected"])),
          cards.add(Divider(thickness: 1))
      });
      return cards.toList();
    }());
  
  }
}
