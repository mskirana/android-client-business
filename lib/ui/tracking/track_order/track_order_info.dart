import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/ui/common/store_call_row.dart';

class TrackOrderInfo extends StatelessWidget {
  final String phrase;

  TrackOrderInfo(this.phrase);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Divider(thickness: 2, color: Colors.black)),
      Text(phrase,
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold)),
      StoreCallRow(),
      Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Divider(thickness: 2, color: Colors.black))
    ]);
  }
}
