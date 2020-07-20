import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/home/home_bottom_app_bar.dart';
import 'package:mskirana_app/ui/home/home_store_view.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: HomeBottomAppBar(),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 36, 10, 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Choose store",
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
                                "Showing stores near your address - Microsoft Signature Bldg,... Bengaluru 560071. "),
                        TextSpan(
                            text: "Change?",
                            style:
                                TextStyle(decoration: TextDecoration.underline))
                      ])),
                  Expanded(child: HomeStoreView()),
                  Center(
                      child: ButtonTheme(
                          minWidth: 50,
                          height: 20,
                          padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                          child: RaisedButton(
                              onPressed: () {},
                              color: Color(0XFF9378FF),
                              child: Text('Next',
                                  style: GoogleFonts.openSans(
                                      color: Colors.white, fontSize: 24)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)))))
                ])));
  }
}
