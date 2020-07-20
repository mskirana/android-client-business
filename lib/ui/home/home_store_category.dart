import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStoreCategory extends StatelessWidget {
  final String name;
  final bool selected;

  HomeStoreCategory(this.name, this.selected);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 50,
        height: 20,
        padding: EdgeInsets.fromLTRB(13, 2, 13, 2),
        child: RaisedButton(
            onPressed: () {},
            color: (selected) ? Colors.blue : Colors.grey[200],
            child: Text(name,
                style: GoogleFonts.openSans(
                    color: (selected) ? Colors.white : Colors.blue,
                    fontSize: 14)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))));
  }
}
