import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/models/product.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/confirmorder/confirm_order_presenter.dart';
import 'package:mskirana_app/ui/confirmorder/confirm_order_store_card.dart';
import 'confirm_order_item_view.dart';

final keyItem = new GlobalKey<ConfirmOrderItemViewState>();

class ConfirmOrderPage extends StatefulWidget {
  final List<dynamic> productsList;
  ConfirmOrderPage({Key key, @required this.productsList}) : super(key: key);
  @override
  ConfirmOrderPageState createState() => ConfirmOrderPageState();
}

class ConfirmOrderPageState extends State<ConfirmOrderPage>
    implements ConfirmOrderContract {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  var callMeChkBox = true, reConfirmCheckBox = true;
  int _addressOption = 0;

  void saveOrder(context) {
    List<Product> products = new List<Product>();
    widget.productsList
        .forEach((element) => {products.add(Product.fromJson(element))});
    Order order = new Order();
    order.products = products;
    //Create oder api call
    ConfirmOrderPresenter presenter;
    presenter = new ConfirmOrderPresenter(this);
    presenter.create(order);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.productsList);
    return Scaffold(
        key: scaffoldkey,
        bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.home),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 36, 10, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Review Order",
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      RichText(
                          text: TextSpan(
                              style: GoogleFonts.openSans(
                                  fontSize: 16, color: Color(0XFF99879D)),
                              children: <TextSpan>[
                            TextSpan(text: "Items ordered")
                          ])),
                      ConfirmOrderItemView(
                          key: keyItem, productsList: widget.productsList),
                      Divider(thickness: 2),
                      RichText(
                          text: TextSpan(
                              style: GoogleFonts.openSans(
                                  fontSize: 16, color: Color(0XFF99879D)),
                              children: <TextSpan>[TextSpan(text: "Store")])),
                      ConfirmOrderStoreCard(
                          'Vijay Stores', '0.7KM', 'Grocery and general store'),
                      Divider(thickness: 2),
                      Container(
                          height: 35,
                          child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: new Radio(
                                value: 0,
                                groupValue: _addressOption,
                                onChanged: (int value) {
                                  setState(() {
                                    _addressOption = 0;
                                  });
                                },
                              ),
                              title: RichText(
                                  text: TextSpan(
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Color(0XFF99879D)),
                                      text: "Pickup items from the store")))),
                      Container(
                          height: 40,
                          child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: new Radio(
                                  value: 1,
                                  groupValue: _addressOption,
                                  onChanged: (int value) {
                                    setState(() {
                                      _addressOption = 1;
                                    });
                                  }),
                              title: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Color(0XFF99879D)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                "Deliver items to Microsoft Signature Building... Bengalure 560071. "),
                                        TextSpan(
                                            text: "Change?",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline))
                                      ])))),
                      SizedBox(height: 15),
                      Container(
                          height: 35,
                          child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: new Checkbox(
                                  value: reConfirmCheckBox,
                                  onChanged: (bool value) {
                                    setState(() {
                                      reConfirmCheckBox = value;
                                    });
                                  }),
                              title:
                                  Text('Reconfirm order after store sets price',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        color: Color(0XFF99879D),
                                      )))),
                      Container(
                          height: 30,
                          child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: new Checkbox(
                                  value: callMeChkBox,
                                  onChanged: (bool value) {
                                    setState(() {
                                      callMeChkBox = value;
                                    });
                                  }),
                              title: Text('Call me for any questions',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Color(0XFF99879D))))),
                      SizedBox(height: 25),
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
                                  child: Text('Confirm Order',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: 24)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60)))))
                    ]))));
  }

  @override
  void onCreateOrderError(String errorText) {
    scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text('Network error while trying to create your order')));
  }

  @override
  void onCreateOrderSuccess(Order order) {
    print(order);
    //TODO : Navigate to the order details screen
  }
}
