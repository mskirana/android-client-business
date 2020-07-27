import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentTypeCard extends StatelessWidget {
  final String paymentName, paymentIconUrl, discountText;
  final int paymentSelected;
  final _addressOption = 0;

  PaymentTypeCard(
      {this.paymentName,
      this.paymentIconUrl,
      this.discountText,
      this.paymentSelected});

  Widget build(BuildContext context) {
    var column = Column(children: <Widget>[
      Text(this.paymentName,
          style: GoogleFonts.openSans(
              fontSize: 14,
              color: Color(0XFF99879D),
              fontWeight: FontWeight.w700)),
      this.discountText != ""
          ? Text(this.discountText,
              softWrap: true,
              style:
                  GoogleFonts.openSans(fontSize: 14, color: Color(0XFF68D75E)))
          : SizedBox.shrink()
    ]);

    var card = Card(
        child: Row(children: <Widget>[
      SizedBox(width: 10),
      Container(
          height: 35,
          width: 30,
          child: new Radio(
            value: this.paymentSelected,
            groupValue: _addressOption,
            onChanged: (_) {},
          )),
      Container(
          height: 65,
          width: 65,
          child: IconButton(
            onPressed: () {},
            icon: new Image.asset(this.paymentIconUrl),
          )),
      Flexible(child: column)
    ]));

    return Container(
        padding: EdgeInsets.all(1), width: double.maxFinite, child: card);
  }
}
