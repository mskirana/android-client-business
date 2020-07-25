import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StoreCallRow extends StatelessWidget {
  final String storeName;

  StoreCallRow({this.storeName = "Vijay Stores"});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      IconButton(
          icon: new Icon(MdiIcons.phoneOutline, size: 24, color: Colors.blue),
          onPressed: () {}),
      Text(
        "Call " + storeName,
        style: GoogleFonts.openSans(fontSize: 18, color: Colors.blue),
      )
    ]);
  }
}
