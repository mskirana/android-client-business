import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/confirmorder/confirm_order_page.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/order/order_item_view.dart';

final keyItem = new GlobalKey<OrderItemViewState>();

class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}


class OrderPageState extends State<OrderPage> {

  void saveOrder(context)
  {
      var products = keyItem.currentState.productsList;
      Navigator.push( context, MaterialPageRoute(
        builder: (context) => ConfirmOrderPage(productsList : products),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.home),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 36, 10, 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Your Order",
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: GoogleFonts.openSans(
                              fontSize: 16, color: Color(0XFF99879D)),
                          children: <TextSpan>[
                        TextSpan(
                            text:
                                "What would you like to order today? You’re ordering from “Vijay Stores”. Some products sold here are vegatables, fruits, rice, cooking oils, biscuits, tea, notebooks, pens, bulbs, batteries, etc.")
                      ])),
                  Expanded(child: OrderItemView(key: keyItem)),
                  Center(
                      child: ButtonTheme(
                          minWidth: 50,
                          height: 20,
                          padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                          child: RaisedButton(
                              onPressed: () {
                                saveOrder(context);
                              },
                              color: Color(0XFF9378FF),
                              child: Text('Next',
                                  style: GoogleFonts.openSans(
                                      color: Colors.white, fontSize: 24)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)))))
                ])));
  }
}
