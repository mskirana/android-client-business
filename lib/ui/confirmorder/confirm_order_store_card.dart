import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOrderStoreCard extends StatelessWidget {
  final String storeName, distance, subTitle;

  ConfirmOrderStoreCard(this.storeName, this.distance, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width: double.maxFinite,
        decoration: new BoxDecoration(color: Color(0XFFE0FFDB)),
        child: ListTile(
            title: Text(storeName,
                style: GoogleFonts.openSans(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            subtitle: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Text(subTitle,
                    style: GoogleFonts.openSans(
                        fontSize: 14, color: Colors.grey))),
            trailing: Column(children: <Widget>[
              Text(distance,
                  style: GoogleFonts.openSans(fontSize: 18, color: Colors.grey))
            ])));
  }
}
