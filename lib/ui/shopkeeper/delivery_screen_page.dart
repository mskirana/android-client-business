import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/login/login_bottom_app_bar.dart';
import 'package:mskirana_app/utils/validator.dart';

class DeliveryScreenPage extends StatelessWidget {
  final List<String> customerDeliveryDetails;
  final _formKey = GlobalKey<FormState>();

  DeliveryScreenPage(this.customerDeliveryDetails);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: LoginBottomAppBar(),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(height: 40),
              Padding(
                  padding: EdgeInsets.only(left: 19, right: 56),
                  child: Text("Delivery Details",
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 40, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left)),
              Padding(
                  padding: EdgeInsets.only(left: 19, right: 56),
                  child: Container(
                      child: Text("Request Order to be Market Complete",
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(153, 135, 157, 100))))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.only(left: 19, right: 56),
                  child: Text(customerDeliveryDetails[0],
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.only(left: 19, right: 56),
                  child: Text(
                      "Delivery Address:  " + customerDeliveryDetails[1],
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(116, 105, 118, 100)))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text("Comments*",
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: SizedBox(
                                    height: 200,
                                    width: 330,
                                    child: new TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please put some comments';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(0.0),
                                              ),
                                              borderSide: new BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            )))),
                              )),
                          SizedBox(height: 30),
                          ButtonTheme(
                              minWidth: 200,
                              height: 50,
                              child: RaisedButton(
                                  onPressed: () {
                                    // if phone number is valid, notify parent!
                                    if (_formKey.currentState.validate()) {}
                                  },
                                  color: Color(0XFF9378FF),
                                  child: Text('Complete',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: 20)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60)))),
                        ],
                      )))
            ])));
  }
}