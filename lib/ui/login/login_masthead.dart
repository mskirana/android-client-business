import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMastHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 60),
        Image(image: AssetImage('assets/logo.jpg')),
        Padding(
            padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
            child: Text(
                'Support your local general stores and order your supplies instantly.',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
