import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStoreCard extends StatelessWidget {
  final String storeName, distance, about;

  HomeStoreCard(this.storeName, this.distance, this.about);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width: double.maxFinite,
        child: Card(
            child: ListTile(
                title: Text(storeName,
                    style: GoogleFonts.openSans(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(about,
                        style: GoogleFonts.openSans(
                            fontSize: 14, color: Colors.grey))),
                trailing: Column(children: <Widget>[
                  Text(distance,
                      style: GoogleFonts.openSans(
                          fontSize: 18, color: Colors.grey)),
                  Text("More Info",
                      style: GoogleFonts.openSans(
                          fontSize: 18, color: Colors.blue))
                ]))));
  }
}
