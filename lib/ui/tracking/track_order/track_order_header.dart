import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackOrderHeader extends StatelessWidget {
  final String icon, phrase;
  final Color phraseColor;

  TrackOrderHeader(this.icon, this.phrase, this.phraseColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Image(
                image: AssetImage(icon),
                alignment: Alignment.center,
                height: 120)),
        Padding(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Center(
                child: Text(phrase,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: phraseColor,
                        fontWeight: FontWeight.bold)))),
      ],
    );
  }
}
