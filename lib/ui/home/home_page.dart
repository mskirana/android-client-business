import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/home/home_address_view.dart';
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
                  HomeAddressView(),
                  Expanded(child: HomeStoreView()),
                ])));
  }
}
