import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/payment/payment_discount_view.dart';
import 'package:mskirana_app/ui/payment/payment_type_view.dart';

class PaymentPage extends StatefulWidget {

  final defaultPayments = [
    {
      "paymentName": "Credit/Debit Card, Net Banking",
      "paymentIconUrl": "assets/logo.jpg",
      "discountText": "",
      "selected" : 0
    }
  ];

  final offerPayments = [
    {
      "paymentName": "Mobikwik Wallet",
      "paymentIconUrl": "assets/logo.jpg",
      "discountText": "Rs 100 Super Cash. Minimum order Rs 800",
      "selected" : 1
    },
    {
      "paymentName": "Paytm",
      "paymentIconUrl": "assets/logo.jpg",
      "discountText": "Rs 75 cashback, min order Rs 1300. Use code:PAYTMBACK",
      "selected" : 2
    },
    {
      "paymentName": "Credit/Debit Card, Net Banking",
      "paymentIconUrl": "assets/logo.jpg",
      "discountText": "Rs 100 CB, min order Rs.1000 on first Airtel txn.",
      "selected" : 3
    },
    {
      "paymentName": "PayZapp",
      "paymentIconUrl": "assets/logo.jpg",
      "discountText": "20% CB,min order Rs 600. Use GROCERY on PayZapp page",
      "selected" : 4
    }
  ];

  final otherOptions = [
    {
      "paymentName": "Cash on Delivery/ Sodexo /Ticket Restaurant",
      "paymentIconUrl": "assets/logo.jpg",
      "discountText": "",
      "selected" : 5
    }
  ];

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.tracking),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 36, 10, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Payment",
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Your Amount Payable',
                                style: GoogleFonts.openSans(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Rs 215',
                                style: GoogleFonts.openSans(
                                    fontSize: 18,fontWeight: FontWeight.bold)),
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Your Total Savings',
                                style: GoogleFonts.openSans(
                                    fontSize: 18, color: Color(0XFF68D75E))),
                            Text('Rs 45',
                                style: GoogleFonts.openSans(
                                    fontSize: 18, color: Color(0XFF68D75E))),
                          ]),
                      Divider(thickness: 6),
                      SizedBox(height: 10),
                      Text('Default Payment Option',
                          style: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Divider(thickness: 1),
                      PaymentTypeView(widget.defaultPayments),
                      Divider(thickness: 6),
                      SizedBox(height: 10),
                      Text('Payment Option With Offers',
                          style: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Divider(thickness: 1),
                      PaymentTypeView(widget.offerPayments),
                      Text('Other Payment Options',
                          style: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Divider(thickness: 6),
                      Divider(thickness: 1),
                      PaymentTypeView(widget.otherOptions),
                      SizedBox(height: 20),
                      Center(
                          child: ButtonTheme(
                              minWidth: 50,
                              height: 20,
                              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                              child: RaisedButton(
                                  onPressed: () {
                                    
                                  },
                                  color: Color(0XFF9378FF),
                                  child: Text('Pay Now',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: 24)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60)))))

                    ]))));
  }
}
