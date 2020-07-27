import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/login/login_bottom_app_bar.dart';

class DeliveryDetailsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                  child: Text("Enter the Delivery Person Details",
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.purple[100]))),
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
                                  child: Text("Delivery Person Name",
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: SizedBox(
                                    height: 34,
                                    width: 330,
                                    child: new TextFormField(
                                        keyboardType: TextInputType.text,
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
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text("Contact Number",
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: SizedBox(
                                    height: 34,
                                    width: 330,
                                    child: new TextFormField(
                                        keyboardType: TextInputType.text,
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
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text("Estimated Delivery Time",
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: SizedBox(
                                    height: 34,
                                    width: 330,
                                    child: new TextFormField(
                                        keyboardType: TextInputType.text,
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
                                    // // if phone number is valid, notify parent!
                                    // if (_formKey.currentState.validate()) {
                                    //   Navigator.of(context).pushReplacementNamed('/home');
                                    // }
                                  },
                                  color: Color(0XFF9378FF),
                                  child: Text('Submit',
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
