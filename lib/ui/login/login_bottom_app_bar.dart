import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('English    |',
                    style: GoogleFonts.openSans(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(
                  '    Hindi',
                  style: GoogleFonts.openSans(color: Colors.grey),
                )
              ],
            )));
  }
}
